import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


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
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(isMobile ? 16 : 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Contact Me',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 24),
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                children: [
                  // Responsive layout for form and contact info
                  isMobile
                      ? _buildMobileLayout()
                      : _buildDesktopLayout(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildContactForm(),
        const SizedBox(height: 32),
        _buildContactInfo(),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(child: _buildContactForm()),
        const SizedBox(width: 40),
        Expanded(child: _buildContactInfo()),
      ],
    );
  }

  Widget _buildContactForm() {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextFormField(
            controller: _nameController,
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: const Icon(Icons.person),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your name';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _emailController,
            decoration: InputDecoration(
              labelText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: const Icon(Icons.email),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your email';
              }
              if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: _messageController,
            decoration: InputDecoration(
              labelText: 'Message',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              prefixIcon: const Icon(Icons.message),
              alignLabelWithHint: true,
            ),
            maxLines: 5,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter your message';
              }
              return null;
            },
          ),
          const SizedBox(height: 24),
          ElevatedButton(
            onPressed: _submitForm,
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: const Text('Send Message'),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo() {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Get in touch',
          style: TextStyle(
            fontSize: isMobile ? 20 : 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        const ContactInfo(
          icon: Icons.email,
          title: 'Email',
          content: 'rysalaksanabhakti@gmail.com',
        ),
        const ContactInfo(
          icon: Icons.phone,
          title: 'Phone',
          content: '+62 831 1177 8069',
        ),
        const ContactInfo(
          icon: Icons.location_on,
          title: 'Location',
          content: 'Malang, Indonesia',
        ),
        const SizedBox(height: 30),
        Text(
          'Follow Me',
          style: TextStyle(
            fontSize: isMobile ? 20 : 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            SocialButton(
              iconUrl: 'https://img.icons8.com/ios-glyphs/30/github.png',
              url: 'https://github.com/Rysalb',
              tooltip: 'GitHub',
            ),
            const SizedBox(width: 16),
            SocialButton(
              iconUrl: 'https://img.icons8.com/ios-glyphs/30/linkedin.png',
              url: 'https://www.linkedin.com/in/rysa-laksana/',
              tooltip: 'LinkedIn',
            ),
            const SizedBox(width: 16),
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

  void _submitForm() async {
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
          query: {
            'subject': 'Portfolio Contact from $name',
            'body': emailBody,
          }.entries.fold('', (prev, e) => 
            '$prev&${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}'
          ).substring(1),
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

  const ContactInfo({
    super.key,
    required this.icon,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Icon(icon, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(content),
            ],
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