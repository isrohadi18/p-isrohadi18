// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'dart:async';

class AboutPage extends StatefulWidget {
  const AboutPage({super.key});

  @override
  State<AboutPage> createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  final ScrollController _mainScrollController = ScrollController();
  final ScrollController _skillsScrollController = ScrollController();
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _startScrolling();
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _mainScrollController.dispose();
    _skillsScrollController.dispose();
    super.dispose();
  }

  void _startScrolling() {
    _timer = Timer.periodic(const Duration(milliseconds: 50), (timer) {
      if (_skillsScrollController.hasClients) {
        final maxScroll = _skillsScrollController.position.maxScrollExtent;
        final currentScroll = _skillsScrollController.offset;
        if (currentScroll >= maxScroll) {
          _skillsScrollController.jumpTo(0);
        } else {
          _skillsScrollController.animateTo(
            currentScroll + 1,
            duration: const Duration(milliseconds: 50),
            curve: Curves.linear,
          );
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    final paddingTop = MediaQuery.of(context).padding.top + 20;

    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.fromLTRB(
        isMobile ? 16 : 32,
        paddingTop, // Add padding for AppBar
        isMobile ? 16 : 32,
        isMobile ? 16 : 32,
      ),
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
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'About Me',
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              color:
                  isDark
                      ? Theme.of(context).colorScheme.primary
                      : Theme.of(context).colorScheme.primary,

              fontWeight: FontWeight.bold,
            ),
          ).animate().slideX(begin: 0.2),
          const SizedBox(height: 18),
          Expanded(
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'I am a Computer Science student focused on building functional and user-friendly applications using various programming languages. I have experience developing full-stack applications, covering front-end interfaces, back-end systems, and database integration. My projects involve real-world use cases, such as management systems and web platforms, which have helped me understand application flow. If you care about the spacing between lines of code and the semicolons in code, lets talk.',
                    textAlign: TextAlign.justify,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: 1.5,
                      color:
                          isDark
                              ? const Color.fromARGB(255, 255, 255, 255)
                              : const Color.fromARGB(255, 0, 0, 0),
                    ),
                  ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2),
                  const SizedBox(height: 30),
                  Text(
                    'Skills',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color:
                          isDark
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.primary,

                      fontWeight: FontWeight.bold,
                    ),
                  ).animate().fadeIn(delay: 400.ms),
                  const SizedBox(height: 18),
                  SingleChildScrollView(
                    controller:
                        _skillsScrollController, // Use skills scroll controller here
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children:
                          [
                                const SkillChip(skill: 'HTML')
                                    .animate()
                                    .fadeIn(delay: 500.ms)
                                    .slideX(begin: -1, end: 0, delay: 500.ms),
                                const SkillChip(skill: 'CSS')
                                    .animate()
                                    .fadeIn(delay: 600.ms)
                                    .slideX(begin: -1, end: 0, delay: 600.ms),
                                const SkillChip(skill: 'JavaScript')
                                    .animate()
                                    .fadeIn(delay: 700.ms)
                                    .slideX(begin: -1, end: 0, delay: 700.ms),
                                const SkillChip(skill: 'PHP')
                                    .animate()
                                    .fadeIn(delay: 800.ms)
                                    .slideX(begin: -1, end: 0, delay: 800.ms),
                                const SkillChip(skill: 'Tailwind')
                                    .animate()
                                    .fadeIn(delay: 900.ms)
                                    .slideX(begin: -1, end: 0, delay: 900.ms),
                                const SkillChip(skill: 'Java')
                                    .animate()
                                    .fadeIn(delay: 1000.ms)
                                    .slideX(begin: -1, end: 0, delay: 1000.ms),
                                const SkillChip(skill: 'Flutter')
                                    .animate()
                                    .fadeIn(delay: 1100.ms)
                                    .slideX(begin: -1, end: 0, delay: 1100.ms),
                                const SkillChip(skill: 'Dart')
                                    .animate()
                                    .fadeIn(delay: 1200.ms)
                                    .slideX(begin: -1, end: 0, delay: 1200.ms),
                                const SkillChip(skill: 'MySQL')
                                    .animate()
                                    .fadeIn(delay: 1300.ms)
                                    .slideX(begin: -1, end: 0, delay: 1300.ms),
                                const SkillChip(skill: 'VSCode')
                                    .animate()
                                    .fadeIn(delay: 1400.ms)
                                    .slideX(begin: -1, end: 0, delay: 1400.ms),
                                const SkillChip(skill: 'Git')
                                    .animate()
                                    .fadeIn(delay: 1500.ms)
                                    .slideX(begin: -1, end: 0, delay: 1500.ms),
                                const SkillChip(skill: 'Github')
                                    .animate()
                                    .fadeIn(delay: 1500.ms)
                                    .slideX(begin: -1, end: 0, delay: 1500.ms),
                                const SkillChip(skill: 'phpMyAdmin')
                                    .animate()
                                    .fadeIn(delay: 1600.ms)
                                    .slideX(begin: -1, end: 0, delay: 1600.ms),
                                const SkillChip(skill: 'NetBeans')
                                    .animate()
                                    .fadeIn(delay: 1600.ms)
                                    .slideX(begin: -1, end: 0, delay: 1600.ms),
                                const SkillChip(skill: 'Arduino')
                                    .animate()
                                    .fadeIn(delay: 1600.ms)
                                    .slideX(begin: -1, end: 0, delay: 1600.ms),
                                const SkillChip(skill: 'Figma')
                                    .animate()
                                    .fadeIn(delay: 1600.ms)
                                    .slideX(begin: -1, end: 0, delay: 1600.ms),
                                const SkillChip(skill: 'Photoshop')
                                    .animate()
                                    .fadeIn(delay: 1600.ms)
                                    .slideX(begin: -1, end: 0, delay: 1600.ms),
                                const SkillChip(skill: 'Illustrator')
                                    .animate()
                                    .fadeIn(delay: 1600.ms)
                                    .slideX(begin: -1, end: 0, delay: 1600.ms),
                                const SkillChip(skill: 'CorelDRAW')
                                    .animate()
                                    .fadeIn(delay: 1600.ms)
                                    .slideX(begin: -1, end: 0, delay: 1600.ms),
                                const SkillChip(skill: 'Capcut')
                                    .animate()
                                    .fadeIn(delay: 1600.ms)
                                    .slideX(begin: -1, end: 0, delay: 1600.ms),
                                const SkillChip(skill: 'Canva')
                                    .animate()
                                    .fadeIn(delay: 1600.ms)
                                    .slideX(begin: -1, end: 0, delay: 1600.ms),
                                const SkillChip(skill: 'Visio')
                                    .animate()
                                    .fadeIn(delay: 1600.ms)
                                    .slideX(begin: -1, end: 0, delay: 1600.ms),
                                const SkillChip(skill: 'Word')
                                    .animate()
                                    .fadeIn(delay: 1600.ms)
                                    .slideX(begin: -1, end: 0, delay: 1600.ms),
                                const SkillChip(skill: 'Excel')
                                    .animate()
                                    .fadeIn(delay: 1600.ms)
                                    .slideX(begin: -1, end: 0, delay: 1600.ms),
                              ]
                              .map(
                                (chip) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 2,
                                  ),
                                  child: chip,
                                ),
                              )
                              .toList(),
                    ),
                  ),
                  const SizedBox(height: 40),
                  Text(
                    'Education',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color:
                          isDark
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ).animate().fadeIn(delay: 1300.ms),
                  const SizedBox(height: 18),
                  const EducationCard(
                    university: 'INDRAPRASTA PGRI UNIVERSITY',
                    degree: 'Bachelor of informatics',
                    year: '2021/2025',
                    gpa: '3.45',
                  ).animate().fadeIn(delay: 1400.ms).slideX(begin: 0.2),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String skill;

  const SkillChip({super.key, required this.skill});

  String _getLogoUrl(String skill) {
    switch (skill.toLowerCase()) {
      case 'html':
        return '../../assets/icons/html.png';
      case 'css':
        return '../../assets/icons/css.png';
      case 'javascript':
        return '../../assets/icons/javascript.png';
      case 'php':
        return '../../assets/icons/php.png';
      case 'tailwind':
        return '../../assets/icons/tailwind.png';
      case 'java':
        return '../../assets/icons/java.png';
      case 'flutter':
        return '../../assets/icons//flutter.png';
      case 'dart':
        return '../../assets/icons/dart.png';
      case 'mysql':
        return '../../assets/icons/mysql.png';
      case 'vscode':
        return '../../assets/icons/vscode.png';
      case 'git':
        return '../../assets/icons/git.png';
      case 'github':
        return '../../assets/icons/github.png';
      case 'phpmyadmin':
        return '../../assets/icons/phpmyadmin.png';
      case 'netbeans':
        return '../../assets/icons/netbeans.png';
      case 'arduino':
        return '../../assets/icons/arduino.png';
      case 'figma':
        return '../../assets/icons/figma.png';
      case 'photoshop':
        return '../../assets/icons/photoshop.png';
      case 'illustrator':
        return '../../assets/icons/illustrator.png';
      case 'coreldraw':
        return '../../assets/icons/coreldraw.png';
      case 'capcut':
        return '../../assets/icons/capcut.png';
      case 'canva':
        return '../../assets/icons/canva.png';
      case 'visio':
        return '../../assets/icons/visio.png';
      case 'word':
        return '../../assets/icons/word.png';
      case 'excel':
        return '../../assets/icons/excel.png';
      default:
        return '';
      // case 'flutter':
      //   return 'https://cdn.iconscout.com/icon/free/png-256/flutter-2752187-2285004.png';
      // case 'dart':
      //   return 'https://img.icons8.com/color/48/dart.png';
      // case 'java':
      //   return 'https://cdn.iconscout.com/icon/free/png-256/java-43-569305.png';
      // case 'python':
      //   return 'https://cdn.iconscout.com/icon/free/png-256/python-3521655-2945099.png';
      // case 'html/css':
      //   return 'https://cdn.iconscout.com/icon/free/png-256/html5-40-1175193.png';
      // case 'javascript':
      //   return 'https://cdn.iconscout.com/icon/free/png-256/javascript-1-225993.png';
      // case 'git':
      //   return 'https://cdn.iconscout.com/icon/free/png-256/git-225996.png';
      // case 'sql':
      //   return 'https://cdn.iconscout.com/icon/free/png-256/sql-4-190807.png';
      // case 'laravel':
      //   return 'https://cdn.iconscout.com/icon/free/png-256/laravel-226015.png';
      // case 'react':
      //   return 'https://cdn.iconscout.com/icon/free/png-256/react-3-1175109.png';
      // case 'php':
      //   return 'https://cdn.iconscout.com/icon/free/png-256/php-2752101-2284918.png';
      // case 'css':
      //   return 'https://cdn.iconscout.com/icon/free/png-256/css3-11-1175239.png';
      // case 'figma':
      //   return 'https://img.icons8.com/color/48/figma--v1.png';
      // case 'word':
      //   return 'https://img.icons8.com/color/48/microsoft-word-2019--v2.png';
      // case 'excel':
      //   return 'https://img.icons8.com/color/48/microsoft-excel-2019--v1.png';
      // case 'canva':
      //   return 'https://img.icons8.com/fluency/48/canva.png';
      // case 'photoshop':
      //   return 'https://img.icons8.com/color/48/adobe-photoshop--v1.png';
      // case 'capcut':
      //   return 'https://images.seeklogo.com/logo-png/43/1/capcut-logo-png_seeklogo-437025.png';
      // case 'go':
      //   return '<https://static.cdnlogo.com/logos/g/35/golang.svg';
      // default:
      //   return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Card(
      elevation: isDark ? 0 : 2,
      color: isDark ? const Color(0xFF1E1E1E) : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          // ignore: duplicate_ignore
          // ignore: deprecated_member_use
          color: Theme.of(
            context,
          ).colorScheme.primary.withOpacity(isDark ? 0.4 : 0.2),
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              _getLogoUrl(skill),
              height: 24,
              width: 24,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox(width: 24);
              },
            ),
            const SizedBox(width: 8),
            Text(
              skill,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color:
                    isDark
                        ? Theme.of(context).colorScheme.primary
                        : Theme.of(context).colorScheme.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EducationCard extends StatelessWidget {
  final String university;
  final String degree;
  final String year;
  final String gpa;

  const EducationCard({
    super.key,
    required this.university,
    required this.degree,
    required this.year,
    required this.gpa,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          gradient: LinearGradient(
            colors:
                isDark
                    ? [const Color(0xFF1E1E1E), const Color(0xFF2A2A2A)]
                    : [
                      Theme.of(context).colorScheme.primary.withOpacity(0.1),
                      Colors.white,
                    ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              university,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),
            Text(
              degree,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Graduation Year: $year',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'GPA: $gpa',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color:
                        isDark
                            ? Theme.of(context).colorScheme.primary
                            : Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
