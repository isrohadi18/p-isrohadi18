import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:portoku_web/pages/home_page.dart';
import 'package:portoku_web/pages/about_page.dart';
import 'package:portoku_web/pages/experience_page.dart';
import 'package:portoku_web/pages/projects_page.dart';
import 'package:portoku_web/pages/certificate_page.dart';
import 'package:portoku_web/pages/contact_page.dart';

void main() {
  runApp(const MyApp());
}

final List<Map<String, dynamic>> navItems = [
  {'title': 'Home', 'icon': Icons.home_rounded, 'page': const HomePage()},
  {
    'title': 'About',
    'icon': Icons.person_outline_rounded,
    'page': const AboutPage(),
  },
  {
    'title': 'Experience',
    'icon': Icons.timeline_rounded,
    'page': const ExperiencePage(),
  },
  {
    'title': 'Projects',
    'icon': Icons.code_rounded,
    'page': const ProjectsPage(),
  },
  {
    'title': 'Certificate',
    'icon': Icons.school_rounded,
    'page': const CertificatePage(),
  },
  {
    'title': 'Contact',
    'icon': Icons.mail_outline_rounded,
    'page': const ContactPage(),
  },
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(
    ThemeMode.system,
  );

  static final ValueNotifier<String> languageNotifier = ValueNotifier(
    'en',
  ); // default English

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          title: 'Rohadi Dwi Junianto',
          themeMode: currentMode,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.orange,
              primary: Colors.orange,
              secondary: Colors.deepOrange,
            ),
            useMaterial3: true,
          ),
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.orange,
              primary: Colors.orange,
              secondary: Colors.deepOrange,
              brightness: Brightness.dark,
            ),
            scaffoldBackgroundColor: const Color(0xFF121212),
            cardColor: const Color(0xFF1E1E1E),
            useMaterial3: true,
          ),
          home: const PortfolioHomePage(),
        );
      },
    );
  }
}

class PortfolioHomePage extends StatefulWidget {
  const PortfolioHomePage({super.key});

  @override
  State<PortfolioHomePage> createState() => _PortfolioHomePageState();
}

class _PortfolioHomePageState extends State<PortfolioHomePage> {
  final PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _scrollToIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });

    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: MyApp.languageNotifier,
      builder: (context, lang, _) {
        final navItems = [
          {
            'title': AppText.get('home', lang),
            'icon': Icons.home_rounded,
            'page': const HomePage(),
          },
          {
            'title': AppText.get('about', lang),
            'icon': Icons.person_outline_rounded,
            'page': const AboutPage(),
          },
          {
            'title': AppText.get('experience', lang),
            'icon': Icons.timeline_rounded,
            'page': const ExperiencePage(),
          },
          {
            'title': AppText.get('projects', lang),
            'icon': Icons.code_rounded,
            'page': const ProjectsPage(),
          },
          {
            'title': AppText.get('certificate', lang),
            'icon': Icons.school_rounded,
            'page': const CertificatePage(),
          },
          {
            'title': AppText.get('contact', lang),
            'icon': Icons.mail_outline_rounded,
            'page': const ContactPage(),
          },
        ];

        final width = MediaQuery.of(context).size.width;
        final isMobile = width < 600;
        final isDark = Theme.of(context).brightness == Brightness.dark;

        return Scaffold(
          extendBodyBehindAppBar: true,
          appBar: AppBar(
            elevation: 0,
            backgroundColor:
                isDark
                    ? Colors.black.withOpacity(0.8)
                    : Colors.white.withOpacity(0.8),

            title:
                isMobile
                    ? Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.menu),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder:
                                  (context) => _buildMobileMenu(lang, navItems),
                            );
                          },
                        ),

                        IconButton(
                          icon: Icon(
                            isDark ? Icons.light_mode : Icons.dark_mode,
                          ),
                          onPressed: () {
                            MyApp.themeNotifier.value =
                                isDark ? ThemeMode.light : ThemeMode.dark;
                          },
                        ),

                        TextButton(
                          onPressed: () {
                            MyApp.languageNotifier.value =
                                lang == 'en' ? 'id' : 'en';
                          },
                          child: Text(
                            lang == 'en' ? 'IND' : 'ENG',
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Spacer(),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(navItems.length, (index) {
                            final item = navItems[index];
                            return AnimatedNavButton(
                              title: item['title'] as String,
                              icon: item['icon'] as IconData,

                              isSelected: _selectedIndex == index,
                              onTap: () => _scrollToIndex(index),
                            );
                          }),
                        ),

                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                icon: Icon(
                                  isDark ? Icons.light_mode : Icons.dark_mode,
                                ),
                                onPressed: () {
                                  MyApp.themeNotifier.value =
                                      isDark ? ThemeMode.light : ThemeMode.dark;
                                },
                              ),
                              const SizedBox(width: 8),
                              TextButton(
                                onPressed: () {
                                  MyApp.languageNotifier.value =
                                      lang == 'en' ? 'id' : 'en';
                                },
                                child: Text(
                                  lang == 'en' ? 'IND' : 'ENG',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 16),
                            ],
                          ),
                        ),
                      ],
                    ),
          ),

          body: PageView(
            controller: _pageController,
            onPageChanged: (index) => setState(() => _selectedIndex = index),
            scrollDirection: Axis.vertical,
            children:
                navItems.map((item) {
                  return Padding(
                    padding: EdgeInsets.only(
                      top: kToolbarHeight + MediaQuery.of(context).padding.top,
                    ),
                    child: SafeArea(top: false, child: item['page'] as Widget),
                  );
                }).toList(),
          ),
        );
      },
    );
  }

  Widget _buildMobileMenu(String lang, List<Map<String, dynamic>> navItems) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Container(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.85,
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // 🔹 MENU NAV (STEP 4 DI SINI)
              ...List.generate(navItems.length, (index) {
                final item = navItems[index];
                return ListTile(
                  leading: Icon(item['icon']),
                  title: Text(item['title']),
                  selected: _selectedIndex == index,
                  onTap: () {
                    _scrollToIndex(index);
                    Navigator.pop(context);
                  },
                );
              }),

              ListTile(
                leading: const Icon(Icons.language),
                title: Text(
                  lang == 'en' ? 'Switch to Indonesian' : 'Ganti ke English',
                ),
                onTap: () {
                  MyApp.languageNotifier.value = lang == 'en' ? 'id' : 'en';
                  Navigator.pop(context);
                },
              ),

              const Divider(),

              ListTile(
                leading: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                title: Text(isDark ? 'Light Mode' : 'Dark Mode'),
                onTap: () {
                  MyApp.themeNotifier.value =
                      isDark ? ThemeMode.light : ThemeMode.dark;
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget bhsText({
  required BuildContext context,
  required String en,
  required String id,
  TextStyle? style,
  TextAlign? textAlign,
}) {
  return ValueListenableBuilder(
    valueListenable: MyApp.languageNotifier,
    builder: (_, lang, __) {
      return Text(lang == 'en' ? en : id, style: style, textAlign: textAlign);
    },
  );
}

class AnimatedNavButton extends StatelessWidget {
  final String title;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const AnimatedNavButton({
    super.key,
    required this.title,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

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
                        ? Colors.white
                        : Colors.black87,
                size: isSelected ? 22 : 20,
              ),
              if (isSelected) ...[
                const SizedBox(width: 8),
                Text(
                  title,
                  style: TextStyle(
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

class AppText {
  static String get(String key, String lang) {
    final Map<String, Map<String, String>> data = {
      'home': {'en': 'Home', 'id': 'Beranda'},
      'about': {'en': 'About', 'id': 'Tentang'},
      'experience': {'en': 'Experience', 'id': 'Pengalaman'},
      'projects': {'en': 'Projects', 'id': 'Proyek'},
      'certificate': {'en': 'Certificate', 'id': 'Sertifikat'},
      'contact': {'en': 'Contact', 'id': 'Kontak'},
      'lightMode': {'en': 'Light Mode', 'id': 'Mode Terang'},
      'darkMode': {'en': 'Dark Mode', 'id': 'Mode Gelap'},
    };

    return data[key]?[lang] ?? '';
  }
}
