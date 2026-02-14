// ignore_for_file: deprecated_member_use
import '../main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
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

  String tr(String en, String id, String lang) {
    return lang == 'en' ? en : id;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: MyApp.languageNotifier,
      builder: (context, lang, _) {
        final isDark = Theme.of(context).brightness == Brightness.dark;
        final width = MediaQuery.of(context).size.width;
        final isMobile = width < 600;
        final paddingleft = MediaQuery.of(context).padding.left;

        return Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.fromLTRB(
            isMobile ? 16 : 32,
            paddingleft, // Add padding for AppBar
            isMobile ? 16 : 32,
            isMobile ? 16 : 32,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SectionTitle(
                title:
                    MyApp.languageNotifier.value == 'en'
                        ? 'About Me'
                        : 'Tentang Saya',
              ),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  physics: const ClampingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 5),
                      bhsText(
                        context: context,
                        en:
                            'I am a Computer Science student with a strong focus on functional application development and solid proficiency in various programming languages. I have hands-on experience building full-stack applications, covering front-end interfaces, back-end systems, and database integration. My projects are based on real-world use cases, including file security applications, management system solutions, and web-based platforms.',
                        // en: 'And if you're concerned about code structure, spacing, or semicolons — let’s talk about it.',
                        id:
                            'Saya adalah mahasiswa Ilmu Komputer yang berfokus pada pengembangan aplikasi fungsional serta memiliki pemahaman yang baik dalam berbagai bahasa pemrograman. Saya berpengalaman mengembangkan aplikasi full-stack, mencakup perancangan antarmuka front-end, pengelolaan sistem back-end, hingga integrasi basis data. Proyek yang saya kerjakan berbasis pada kebutuhan dunia nyata, seperti aplikasi keamanan file, sistem manajemen, dan platform berbasis web.',
                        // id: 'Jika Anda peduli pada struktur kode, kerapihan penulisan, maupun detail kecil seperti spasi dan titik koma — mari kita diskusikan.',
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: AboutmeTextStyle.aboutSize,
                          height: 1.6,
                        ),
                      ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2),
                      const SizedBox(height: 1.6),
                      bhsText(
                        context: context,
                        en:
                            'And if you\'re concerned about code structure, spacing, or semicolons — let’s talk about it.',

                        id:
                            'Jika Anda peduli pada struktur kode, kerapihan penulisan, maupun detail kecil seperti spasi dan titik koma — Mari kita diskusikan.',
                        textAlign: TextAlign.justify,
                        style: const TextStyle(
                          fontSize: AboutmeTextStyle.aboutSize,
                          height: 1.6,
                        ),
                      ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.2),
                      const SizedBox(height: 25),
                      Text(
                        lang == 'en' ? 'Skills Tools' : 'Keterampilan',

                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.copyWith(
                          color:
                              isDark
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.primary,

                          fontWeight: FontWeight.bold,
                        ),
                      ).animate().fadeIn(delay: 400.ms),
                      const SizedBox(height: 15),
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
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 500.ms,
                                        ),
                                    const SkillChip(skill: 'CSS')
                                        .animate()
                                        .fadeIn(delay: 600.ms)
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 600.ms,
                                        ),
                                    const SkillChip(skill: 'JavaScript')
                                        .animate()
                                        .fadeIn(delay: 700.ms)
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 700.ms,
                                        ),
                                    const SkillChip(skill: 'PHP')
                                        .animate()
                                        .fadeIn(delay: 800.ms)
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 800.ms,
                                        ),
                                    const SkillChip(skill: 'Tailwind')
                                        .animate()
                                        .fadeIn(delay: 900.ms)
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 900.ms,
                                        ),
                                    const SkillChip(skill: 'Java')
                                        .animate()
                                        .fadeIn(delay: 1000.ms)
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 1000.ms,
                                        ),
                                    const SkillChip(skill: 'Flutter')
                                        .animate()
                                        .fadeIn(delay: 1100.ms)
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 1100.ms,
                                        ),
                                    const SkillChip(skill: 'Dart')
                                        .animate()
                                        .fadeIn(delay: 1200.ms)
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 1200.ms,
                                        ),
                                    const SkillChip(skill: 'MySQL')
                                        .animate()
                                        .fadeIn(delay: 1300.ms)
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 1300.ms,
                                        ),
                                    const SkillChip(skill: 'VSCode')
                                        .animate()
                                        .fadeIn(delay: 1400.ms)
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 1400.ms,
                                        ),
                                    const SkillChip(skill: 'Git')
                                        .animate()
                                        .fadeIn(delay: 1500.ms)
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 1500.ms,
                                        ),
                                    const SkillChip(skill: 'Github')
                                        .animate()
                                        .fadeIn(delay: 1500.ms)
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 1500.ms,
                                        ),
                                    const SkillChip(skill: 'phpMyAdmin')
                                        .animate()
                                        .fadeIn(delay: 1600.ms)
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 1600.ms,
                                        ),
                                    const SkillChip(skill: 'Netbeans')
                                        .animate()
                                        .fadeIn(delay: 1600.ms)
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 1600.ms,
                                        ),
                                    const SkillChip(skill: 'Arduino')
                                        .animate()
                                        .fadeIn(delay: 1600.ms)
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 1600.ms,
                                        ),
                                    const SkillChip(skill: 'Figma')
                                        .animate()
                                        .fadeIn(delay: 1600.ms)
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 1600.ms,
                                        ),
                                    const SkillChip(skill: 'Balsamiq')
                                        .animate()
                                        .fadeIn(delay: 1600.ms)
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 1600.ms,
                                        ),
                                    const SkillChip(skill: 'Drawio')
                                        .animate()
                                        .fadeIn(delay: 1600.ms)
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 1600.ms,
                                        ),
                                    const SkillChip(skill: 'Photoshop')
                                        .animate()
                                        .fadeIn(delay: 1600.ms)
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 1600.ms,
                                        ),
                                    const SkillChip(skill: 'Illustrator')
                                        .animate()
                                        .fadeIn(delay: 1600.ms)
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 1600.ms,
                                        ),
                                    const SkillChip(skill: 'CorelDRAW')
                                        .animate()
                                        .fadeIn(delay: 1600.ms)
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 1600.ms,
                                        ),
                                    const SkillChip(skill: 'Capcut')
                                        .animate()
                                        .fadeIn(delay: 1600.ms)
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 1600.ms,
                                        ),
                                    const SkillChip(skill: 'Canva')
                                        .animate()
                                        .fadeIn(delay: 1600.ms)
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 1600.ms,
                                        ),
                                    const SkillChip(skill: 'Visio')
                                        .animate()
                                        .fadeIn(delay: 1600.ms)
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 1600.ms,
                                        ),
                                    const SkillChip(skill: 'Word')
                                        .animate()
                                        .fadeIn(delay: 1600.ms)
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 1600.ms,
                                        ),
                                    const SkillChip(skill: 'Excel')
                                        .animate()
                                        .fadeIn(delay: 1600.ms)
                                        .slideX(
                                          begin: -1,
                                          end: 0,
                                          delay: 1600.ms,
                                        ),
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
                      const SizedBox(height: 25),
                      Text(
                        lang == 'en' ? 'Education' : 'Pendidikan',

                        style: Theme.of(
                          context,
                        ).textTheme.headlineMedium?.copyWith(
                          color:
                              isDark
                                  ? Theme.of(context).colorScheme.primary
                                  : Theme.of(context).colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ).animate().fadeIn(delay: 1300.ms),
                      const SizedBox(height: 15),
                      EducationCard(
                        university:
                            lang == 'en'
                                ? 'INDRAPRASTA PGRI UNIVERSITY'
                                : 'UNIVERSITAS INDRAPRASTA PGRI',
                        degree:
                            lang == 'en'
                                ? 'Bachelor - Informatics Engineering'
                                : 'Sarjana - Teknik Informatika',
                        year: '2021/2025',
                        gpa: '3.45',
                        linkVerifikasi:
                            'https://pddikti.kemdiktisaintek.go.id/detail-mahasiswa/95rAqqeLm78ul9xYRP8NbZbdHoe_IbjvXgefdWdaDVKxYH-1Idy0u9uqIwC_Uqz9PzHUZA==',
                      ).animate().fadeIn(delay: 1400.ms).slideX(begin: 0.2),
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
}

class SkillChip extends StatelessWidget {
  final String skill;

  const SkillChip({super.key, required this.skill});

  String _getLogoUrl(String skill) {
    switch (skill.toLowerCase()) {
      case 'html':
        return '../../assets/icons/skills/html.png';
      case 'css':
        return '../../assets/icons/skills/css.png';
      case 'javascript':
        return '../../assets/icons/skills/javascript.png';
      case 'php':
        return '../../assets/icons/skills/php.png';
      case 'tailwind':
        return '../../assets/icons/skills/tailwind.png';
      case 'java':
        return '../../assets/icons/skills/java.png';
      case 'flutter':
        return '../../assets/icons/skills/flutter.png';
      case 'dart':
        return '../../assets/icons/skills/dart.png';
      case 'mysql':
        return '../../assets/icons/skills/mysql.png';
      case 'vscode':
        return '../../assets/icons/skills/vscode.png';
      case 'git':
        return '../../assets/icons/skills/git.png';
      case 'github':
        return '../../assets/icons/skills/github.png';
      case 'phpmyadmin':
        return '../../assets/icons/skills/phpmyadmin.png';
      case 'netbeans':
        return '../../assets/icons/skills/netbeans.png';
      case 'arduino':
        return '../../assets/icons/skills/arduino.png';
      case 'figma':
        return '../../assets/icons/skills/figma.png';
      case 'balsamiq':
        return '../../assets/icons/skills/balsamiq.png';
      case 'drawio':
        return '../../assets/icons/skills/drawio.png';
      case 'photoshop':
        return '../../assets/icons/skills/photoshop.png';
      case 'illustrator':
        return '../../assets/icons/skills/illustrator.png';
      case 'coreldraw':
        return '../../assets/icons/skills/coreldraw.png';
      case 'capcut':
        return '../../assets/icons/skills/capcut.png';
      case 'canva':
        return '../../assets/icons/skills/canva.png';
      case 'visio':
        return '../../assets/icons/skills/visio.png';
      case 'word':
        return '../../assets/icons/skills/word.png';
      case 'excel':
        return '../../assets/icons/skills/excel.png';
      default:
        return '';
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
  final String linkVerifikasi;

  const EducationCard({
    super.key,
    required this.university,
    required this.degree,
    required this.year,
    required this.gpa,
    required this.linkVerifikasi,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Container(
        padding: const EdgeInsets.all(30),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          gradient: LinearGradient(
            colors:
                isDark
                    ? [const Color(0xFF1E1E1E), const Color(0xFF2A2A2A)]
                    : [
                      Theme.of(context).colorScheme.primary.withOpacity(0.08),
                      Colors.white,
                    ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ───────────────── HEADER ROW ─────────────────
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // LEFT SIDE (MAIN INFO)
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        university,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        degree,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),

                // RIGHT SIDE (META INFO)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      bhsText(
                        context: context,
                        en: 'Graduation Year',
                        id: 'Tahun Lulus',

                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        year,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Theme.of(
                            context,
                          ).colorScheme.primary.withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: bhsText(
                          context: context,
                          en: 'GPA $gpa',
                          id: 'IPK $gpa',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            // ───────────────── VERIFICATION BUTTON ─────────────────
            OutlinedButton.icon(
              onPressed: () async {
                final Uri url = Uri.parse(linkVerifikasi);
                if (!await launchUrl(
                  url,
                  mode: LaunchMode.externalApplication,
                )) {
                  throw MyApp.languageNotifier.value == 'en'
                      ? 'Unable to open verification link'
                      : 'Tidak dapat membuka link verifikasi';
                }
              },
              icon: const Icon(Icons.verified_outlined, size: 18),
              label: bhsText(
                context: context,
                en: 'Education Verification (PDDIKTI)',
                id: 'Verifikasi Pendidikan (PDDIKTI)',

                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),

            const SizedBox(height: 6),

            bhsText(
              context: context,
              en:
                  '*Education data can be verified through the official government website',
              id:
                  '*Data pendidikan dapat diverifikasi melalui situs web resmi pemerintah.',

              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
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
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.only(left: 0), //
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
        ),
      ],
    );
  }
}

class AboutmeTextStyle {
  static const double aboutSize = 15.5;
}
