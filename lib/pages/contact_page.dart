import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../main.dart';

String bhs(BuildContext context, {required String en, required String id}) {
  return MyApp.languageNotifier.value == 'en' ? en : id;
}

String? requiredValidator(
  BuildContext context,
  String? value, {
  required String en,
  required String id,
}) {
  if (value == null || value.isEmpty) {
    return MyApp.languageNotifier.value == 'en' ? en : id;
  }
  return null;
}

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void initState() {
    super.initState();

    MyApp.languageNotifier.addListener(_refreshFormLanguage);
  }

  void _refreshFormLanguage() {
    if (!_hasSubmitted) return;
    _formKey.currentState!.reset();
    _formKey.currentState!.validate();
  }

  @override
  void dispose() {
    MyApp.languageNotifier.removeListener(_refreshFormLanguage);

    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: MyApp.languageNotifier,
      builder: (context, lang, _) {
        final width = MediaQuery.of(context).size.width;
        final isMobile = width < 900;

        return Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.all(isMobile ? 16 : 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(
                title:
                    MyApp.languageNotifier.value == 'en' ? 'Contact' : 'Kontak',
              ),
              const SizedBox(height: 15),
              Expanded(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  InputDecoration _inputDecoration({
    required String label,
    required IconData icon,
    bool isMessage = false,
  }) {
    return InputDecoration(
      labelText: label,
      alignLabelWithHint: isMessage,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),

      /// ICON POSITION
      prefixIcon: Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 12,
          top: isMessage ? 14 : 0, // 🔥 message sejajar atas
        ),
        child: Icon(icon),
      ),

      /// BIKIN TEKS LEBIH KE TENGAH
      contentPadding: EdgeInsets.symmetric(
        vertical: isMessage ? 18 : 20,
        horizontal: 12,
      ),

      prefixIconConstraints: const BoxConstraints(minWidth: 54),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContactForm(),
        const SizedBox(height: 32),
        _buildContactInfoCore(),
        const SizedBox(height: 24),
        _buildSocialOnly(),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // ================= KIRI =================
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [const ContactCTA(), _buildContactForm()],
          ),
        ),

        const SizedBox(width: 60),

        // ================= KANAN =================
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const AvailabilityStatus(),
              const SizedBox(height: 20),
              _buildContactInfoCore(),
              const SizedBox(height: 20),
              _buildSocialOnly(),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactForm() {
    return ValueListenableBuilder<String>(
      valueListenable: MyApp.languageNotifier,
      builder: (context, lang, _) {
        return Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: _nameController,
                decoration: _inputDecoration(
                  label: bhs(context, en: 'Name', id: 'Nama'),
                  icon: Icons.person,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return bhs(
                      context,
                      en: 'Please enter your name',
                      id: 'Silahkan masukkan nama anda',
                    );
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _emailController,
                decoration: _inputDecoration(label: 'Email', icon: Icons.email),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return bhs(
                      context,
                      en: 'Please enter your email',
                      id: 'Silahkan masukkan email anda',
                    );
                  }
                  if (!RegExp(
                    r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                  ).hasMatch(value)) {
                    return bhs(
                      context,
                      en: 'Please enter a valid email',
                      id: 'Masukkan email yang valid',
                    );
                  }
                  return null;
                },
              ),

              const SizedBox(height: 16),

              TextFormField(
                controller: _messageController,
                maxLines: 6,
                decoration: _inputDecoration(
                  label: bhs(context, en: 'Message', id: 'Pesan'),
                  icon: Icons.message,
                  isMessage: false,
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return bhs(
                      context,
                      en: 'Please enter your message',
                      id: 'Silahkan masukkan pesan anda',
                    );
                  }
                  return null;
                },
              ),

              const SizedBox(height: 24),

              ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  bhs(context, en: 'Send Message', id: 'Kirim Pesan'),
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildContactInfoCore() {
    return ValueListenableBuilder<String>(
      valueListenable: MyApp.languageNotifier,
      builder: (context, lang, _) {
        final screenWidth = MediaQuery.of(context).size.width;
        final isMobile = screenWidth < 600;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bhs(context, en: 'Contact Me', id: 'Kontak Saya'),
              style: TextStyle(
                fontSize: isMobile ? 20 : 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 13),

            ContactInfo(
              icon: Icons.email,
              title: 'Email',
              content: 'rohadii861@gmail.com',
              action: ElevatedButton.icon(
                onPressed: () {
                  launchUrl(
                    Uri.parse(
                      "mailto:rohadii861@gmail.com?subject=Portfolio%20Contact&body=Hello%20Rohadi,%0A%0AI%20found%20your%20portfolio%20and%20want%20to%20connect.%0A%0AThank%20you.",
                    ),
                  );
                },
                icon: const Icon(Icons.email),
                label: Text(
                  bhs(
                    context,
                    en: 'Send Message Email',
                    id: 'Kirim Pesan Email',
                  ),
                ),
              ),
            ),

            ContactInfo(
              icon: Icons.phone,
              title: MyApp.languageNotifier.value == 'en' ? 'Phone' : 'Telepon',
              content: '+62 898 8064 287',
              action: ElevatedButton.icon(
                onPressed: () {
                  launchUrl(
                    Uri.parse(
                      'https://wa.me/628988064287?text=Hello%20Rohadi,%0A%0AI%20found%20your%20portfolio%20and%20would%20like%20to%20discuss%20a%20project.%0A%0AThank%20you.',
                    ),
                    mode: LaunchMode.externalApplication,
                  );
                },
                icon: Image.network('../../assets/images/wtsp.png', width: 20),
                label: const Text('WhatsApp'),
              ),
            ),

            const ContactInfo(
              icon: Icons.location_on,
              title: 'Location',
              content: 'Malang, Indonesia',
            ),
          ],
        );
      },
    );
  }

  Widget _buildSocialOnly() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Follow Me',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 16),
        Wrap(
          spacing: 16,
          runSpacing: 16,
          children: const [
            SocialButton(
              iconUrl: 'https://img.icons8.com/ios-glyphs/30/github.png',
              url: 'https://github.com/Rysalb',
              tooltip: 'GitHub',
            ),
            SocialButton(
              iconUrl: 'https://img.icons8.com/ios-glyphs/30/linkedin.png',
              url: 'https://www.linkedin.com/in/rysa-laksana/',
              tooltip: 'LinkedIn',
            ),
            SocialButton(
              iconUrl: 'https://img.icons8.com/ios-glyphs/30/instagram-new.png',
              url: 'https://www.instagram.com/rysalaksana/',
              tooltip: 'Instagram',
            ),
          ],
        ),
      ],
    );
  }

  bool _hasSubmitted = false;

  void _submitForm() async {
    _hasSubmitted = true;

    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final email = _emailController.text;
      final message = _messageController.text;

      // Create a well-formatted email body
      final emailBody = '''
From: $name
Email: $email

Message:
$message
''';

      try {
        // Use JS interop to open email in new tab with pre-filled content
        final Uri emailUri = Uri(
          scheme: 'mailto',
          path: 'rysalaksanabhakti@gmail.com',
          query: {'subject': 'Portfolio Contact from $name', 'body': emailBody}
              .entries
              .fold(
                '',
                (prev, e) =>
                    '$prev&${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}',
              )
              .substring(1),
        );

        // Use window.open for web
        if (await launchUrl(
          emailUri,
          mode: LaunchMode.externalApplication,
          webOnlyWindowName: '_self',
        )) {
          _formKey.currentState!.reset();
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Opening email client...'),
                backgroundColor: Colors.green,
              ),
            );
          }
        } else {
          throw Exception('Could not launch email client');
        }
      } catch (e) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Could not open email client'),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }
}

class ContactInfo extends StatelessWidget {
  final IconData icon;
  final String title;
  final String content;
  final Widget? action;

  const ContactInfo({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start, // 🔥 KUNCI
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Icon(icon, color: Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(width: 16),

          /// CONTENT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 2),
                Text(content),

                /// BUTTON TURUN KE BAWAH
                if (action != null) ...[const SizedBox(height: 8), action!],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SocialButton extends StatelessWidget {
  final String iconUrl;
  final String url;
  final String tooltip;

  const SocialButton({
    super.key,
    required this.iconUrl,
    required this.url,
    required this.tooltip,
  });

  Future<void> _launchUrl() async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Tooltip(
      message: tooltip,
      child: InkWell(
        onTap: _launchUrl,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.network(
            iconUrl.replaceAll('/30/', '/30/${isDark ? 'ffffff' : '000000'}/'),
            width: 24,
            height: 24,
            errorBuilder: (context, error, stackTrace) {
              return Icon(
                Icons.error,
                color: isDark ? Colors.white : Colors.black,
              );
            },
          ),
        ),
      ),
    );
  }
}

class ContactCTA extends StatelessWidget {
  const ContactCTA({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: MyApp.languageNotifier,
      builder: (context, lang, _) {
        final width = MediaQuery.of(context).size.width;
        final isMobile = width < 600;

        return Container(
          margin: const EdgeInsets.only(bottom: 24),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary.withOpacity(0.08),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: Theme.of(context).colorScheme.primary.withOpacity(0.2),
            ),
          ),
          child: Text(
            bhs(
              context,
              en:
                  'Have a project in mind, collaboration idea, or just want to say hi?\n'
                  'Feel free to reach out — Let\'s get to know each other 👋',
              id:
                  'Punya proyek, ide kolaborasi, atau sekadar ingin menyapa?\n'
                  'Jangan ragu untuk menghubungi saya — Mari kita saling mengenal. 👋',
            ),
            style: TextStyle(
              fontSize: isMobile ? 13 : 14,
              height: 1.5,
              color: Theme.of(context).textTheme.bodyMedium?.color,
              fontWeight: FontWeight.w500,
            ),
          ),
        );
      },
    );
  }
}

class QuickContactButtons extends StatelessWidget {
  const QuickContactButtons({super.key});

  Future<void> _launch(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [
          ElevatedButton.icon(
            onPressed:
                () => _launch(
                  'mailto:rohadii861@gmail.com'
                  '?subject=Portfolio Contact',
                ),
            icon: const Icon(Icons.email),
            label: const Text('Email Me'),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 14 : 18,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          OutlinedButton.icon(
            onPressed:
                () => _launch(
                  'https://wa.me/6283111778069'
                  '?text=Hello,%20I%20found%20your%20portfolio',
                ),
            icon: const Icon(Icons.chat),
            label: const Text('WhatsApp'),
            style: OutlinedButton.styleFrom(
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 14 : 18,
                vertical: 12,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class AvailabilityStatus extends StatelessWidget {
  const AvailabilityStatus({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: MyApp.languageNotifier,
      builder: (context, lang, _) {
        final isDark = Theme.of(context).brightness == Brightness.dark;

        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.green.withOpacity(isDark ? 0.15 : 0.1),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: Colors.green.withOpacity(0.4)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.circle, color: Colors.green, size: 10),
              const SizedBox(width: 8),

              /// 🔥 INI KUNCI ANTI OVERFLOW
              Flexible(
                child: Text(
                  bhs(
                    context,
                    en:
                        'Currently open for internship, freelance, or full-time opportunities',
                    id:
                        'Saat ini terbuka untuk peluang magang, lepas, atau penuh waktu',
                  ),
                  softWrap: true,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 5), //
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
        ),
      ],
    );
  }
}
