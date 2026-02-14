import 'dart:ui';
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final lang = MyApp.languageNotifier.value;

    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        image: DecorationImage(
          image: NetworkImage(
            'https://images.unsplash.com/photo-1557683316-973673baf926',
          ),
          fit: BoxFit.cover,
          opacity: Theme.of(context).brightness == Brightness.dark ? 0.05 : 0.1,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 80,
              backgroundImage: AssetImage(
                '../../assets/images/home/profile.png',
              ),
            ).animate().fadeIn(duration: 600.ms).scale(delay: 200.ms),
            const SizedBox(height: 20),
            Text(
                  'Rohadi Dwi Junianto',
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                )
                .animate()
                .fadeIn(duration: 600.ms)
                .slideY(begin: 0.3, delay: 300.ms),
            const SizedBox(height: 10),
            DefaultTextStyle(
              style: Theme.of(
                context,
              ).textTheme.headlineSmall!.copyWith(color: Colors.grey),
              child: AnimatedTextKit(
                animatedTexts: [
                  TypewriterAnimatedText(
                    'Bachelor of Informatics Engineering',
                    speed: const Duration(milliseconds: 100),
                  ),
                  TypewriterAnimatedText(
                    'UI/UX designers',
                    speed: const Duration(milliseconds: 100),
                  ),
                  TypewriterAnimatedText(
                    'Fullstack Developer',
                    speed: const Duration(milliseconds: 100),
                  ),
                  TypewriterAnimatedText(
                    'Digital Strategy & Design',
                    speed: const Duration(milliseconds: 100),
                  ),
                  TypewriterAnimatedText(
                    'Information Technology Professional',
                    speed: const Duration(milliseconds: 100),
                  ),
                  TypewriterAnimatedText(
                    'Web Developer',
                    speed: const Duration(milliseconds: 100),
                  ),
                ],
                repeatForever: true,
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                      onPressed: () async {
                        final Uri url = Uri.parse(
                          'https://drive.google.com/file/d/1Ci2baGwcGqTHBFlOCjuVo9d7ak-c7fbv/view?usp=sharing',
                        );
                        if (!await launchUrl(url)) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                lang == 'en'
                                    ? 'Failed to Download CV'
                                    : 'Gagal Mengunduh CV',
                              ),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                      icon: const Icon(Icons.download),
                      label: Text(
                        lang == 'en' ? 'Download CV' : 'Unduh CV',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 16,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    )
                    .animate()
                    .fadeIn(delay: 800.ms)
                    .slideX(begin: -0.3, delay: 800.ms),
                const SizedBox(width: 16),
                ElevatedButton.icon(
                  onPressed: () async {
                    final Uri url = Uri.parse(
                      'https://wa.me/628988064287?text=Hello%20Rohadi%2C%20I%20want%20to%20ask%20about...',
                    );
                    if (!await launchUrl(url)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            lang == 'en'
                                ? 'Failed to open WhatsApp'
                                : 'Gagal membuka WhatsApp',
                          ),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  icon: const Icon(Icons.phone),
                  label: Text(
                    lang == 'en' ? 'Contact Me' : 'Kontak Saya',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ).animate().fadeIn(delay: 800.ms).slideX(begin: 0.3, delay: 800.ms),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

PreferredSizeWidget buildAppBar(BuildContext context) {
  return AppBar(
    elevation: 0,
    backgroundColor:
        Theme.of(context).brightness == Brightness.dark
            ? Colors.black.withOpacity(0.8)
            : Colors.white.withOpacity(0.8),
    flexibleSpace: ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(color: Colors.transparent),
      ),
    ),
  );
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomButton({
    Key? key,
    required this.icon,
    required this.title,
    this.isSelected = false,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: isSelected ? 16 : 12,
            vertical: 8,
          ),
          decoration: BoxDecoration(
            color:
                isSelected
                    ? Theme.of(context).colorScheme.primary
                    : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                color:
                    isSelected
                        ? Colors.white
                        : isDark
                        ? Colors.white70
                        : Colors.black87,
                size: 20,
              ),
              if (isSelected) ...[
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
