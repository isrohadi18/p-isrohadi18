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

final List<Map<String, dynamic>> _navItems = [
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

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          title: 'Rysa Laksana Portfolio',
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
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor:
            isDark
                // ignore: deprecated_member_use
                ? Colors.black.withOpacity(0.8)
                // ignore: deprecated_member_use
                : Colors.white.withOpacity(0.8),
        flexibleSpace: ClipRect(
          child: BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: Colors.transparent),
          ),
        ),
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
                          builder: (context) => _buildMobileMenu(),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
                      onPressed: () {
                        MyApp.themeNotifier.value =
                            isDark ? ThemeMode.light : ThemeMode.dark;
                      },
                    ),
                  ],
                )
                : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(_navItems.length, (index) {
                        final item = _navItems[index];
                        return AnimatedNavButton(
                          title: item['title'],
                          icon: item['icon'],
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
                          const SizedBox(width: 16),
                        ],
                      ),
                    ),
                  ],
                ),
      ),
      body: SafeArea(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) => setState(() => _selectedIndex = index),
          scrollDirection: Axis.vertical,
          children: _navItems.map((item) => item['page'] as Widget).toList(),
        ),
      ),
    );
  }

  Widget _buildMobileMenu() {
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
              ...List.generate(_navItems.length, (index) {
                final item = _navItems[index];
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
