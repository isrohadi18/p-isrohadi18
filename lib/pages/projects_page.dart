import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../main.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        // Centered layout max width
        const double maxContentWidth = 1200;

        final contentWidth = width > maxContentWidth ? maxContentWidth : width;

        final horizontalPadding =
            width > maxContentWidth ? (width - maxContentWidth) / 2 : 20.0;

        // Fluid grid calculation
        final crossAxisCount = (contentWidth / 350).floor().clamp(1, 4);

        final childAspectRatio = width < 600 ? 1.05 : 0.81;

        final projects = _buildProjects();

        return CustomScrollView(
          slivers: [
            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: 10,
              ),
              sliver: SliverPersistentHeader(
                pinned: true,
                delegate: ProjectsHeaderDelegate(),
              ),
            ),

            SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: 20,
              ),
              sliver: SliverGrid(
                delegate: SliverChildBuilderDelegate((context, index) {
                  return HoverCard(
                    child: projects[index]
                        .animate(delay: (120 * index).ms)
                        .fadeIn(duration: 400.ms)
                        .slideY(begin: 0.1),
                  );
                }, childCount: projects.length),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 30,
                  mainAxisSpacing: 30,
                  childAspectRatio: childAspectRatio,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  List<ProjectCard> _buildProjects() {
    return const [
      ProjectCard(
        title: 'CRYPTO - APP',
        description:
            'A Java-based desktop file security application that encrypts and decrypts files using the Advanced Encryption Standard (AES) algorithm in CBC mode, and password protection using BCrypt. It features user management, logging, and encryption performance statistics.',
        technologies: ['Java', 'MySQL', 'AES', 'BCrypt', 'Netbeans'],
        imageUrl: '../../assets/images/project/aes.png',
        githubUrl: 'https://github.com/isrohadi18/crypto-file-aes-bcrypt',
        demoUrl: 'https://youtu.be/xfjKTzfe644?si=X6Jnd1TJnoAapqy8',
        demoType: DemoType.video,
        downloadUrl:
            'https://github.com/isrohadi18/p-isrohadi18/releases/download/downlaodaes/CyrptoFileAES.zip',
        isAssetImage: true,
        isFeatured: true,
      ),
      ProjectCard(
        title: 'Khodam Check Application (.exe)',
        description:
            'The Khodam Check app is an interactive tool that allows you to check the presence and type of khodam that may be accompanying you. With a user-friendly interface and the latest Electron technology, this app offers an entertaining experience for users interested in the mystical world.',
        technologies: ['HTML', 'CSS', 'JavaScript', 'Electron', 'Node.Js'],
        imageUrl: '../../assets/images/project/khodam.png',
        githubUrl: 'https://github.com/isrohadi18/Khodam-app',
        demoUrl: '',
        demoType: DemoType.web,
        isAssetImage: true,
      ),
      ProjectCard(
        title: 'Book Management Application',
        description:
            'The Book Management application is a Java-based desktop application designed to help manage book data neatly, quickly, and in a structured manner. This application is suitable for use by schools, school cooperatives, book warehouse administrators, and administrative staff who need an easy-to-use bookkeeping system.',
        technologies: ['Java', 'MySQL', 'Netbeans', 'JasperReports'],
        imageUrl: '../../assets/images/project/lks.png',
        githubUrl: 'https://github.com/isrohadi18/App-Pengelola-Buku-Lks',
        demoUrl:
            'https://www.youtube.com/watch?v=77W9XhZUtYI&list=PLtcA926v9yHFdFkaujmU_D_d8-eAmVIn9&index=2',
        demoType: DemoType.video,
        downloadUrl: '',
        isAssetImage: true,
      ),
      ProjectCard(
        title: 'Digital Solutions Application Techlogo Profile Website',
        description:
            'TechLogo Nexus is a modern company profile website designed to represent an IT & Digital Solutions company. This project showcases a clean UI, responsive layout, and interactive features using HTML, CSS, and JavaScript.',
        technologies: ['HTML', 'CSS', 'JavaScript'],
        imageUrl: '../../assets/images/project/techlogo.png',
        githubUrl: 'https://github.com/isrohadi18/CodingCamp-RohadiDJ',
        demoUrl: 'https://isrohadi18.github.io/CodingCamp-RohadiDJ/',
        demoType: DemoType.web,
        isAssetImage: true,
      ),
      ProjectCard(
        title: 'Smart Calculator for Calculating Good Deeds',
        description:
            'A pure HTML, CSS, and JavaScript-based calculator application designed to help users calculate their Zakat al-Mal, Zakat al-Fitr, and Infaq obligations quickly, accurately, and completely offline. This application is ideal for personal use, community use, or religious institutions like mosques, as it does not require a backend or internet connection.',
        technologies: ['HTML', 'CSS', 'JavaScript'],
        imageUrl: '../../assets/images/project/amalbaik.png',
        githubUrl: 'https://github.com/isrohadi18/App-hisabamalbaik',
        demoUrl: 'https://isrohadi18.github.io/CodingCamp-RohadiDJ/',
        demoType: DemoType.web,
        isAssetImage: true,
      ),
    ];
  }
}

class SectionTitle extends StatelessWidget {
  final String title;
  final String subtitle;

  const SectionTitle({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 0), //
          child: Text(
            title,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
        ),
        const SizedBox(height: 2),
        Padding(
          padding: const EdgeInsets.only(left: 10), //
          child: Text(
            subtitle,
            style: Theme.of(
              context,
            ).textTheme.bodyMedium?.copyWith(color: Colors.grey),
          ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.15),
        ),
      ],
    );
  }
}

enum DemoType { none, video, web }

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final String imageUrl;
  final String githubUrl;
  final String? demoUrl;
  final String? downloadUrl;
  final DemoType demoType;
  final bool isAssetImage;
  final bool isFeatured;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.technologies,
    required this.imageUrl,
    required this.githubUrl,
    this.demoUrl,
    this.downloadUrl,
    this.demoType = DemoType.none,
    this.isAssetImage = false,
    this.isFeatured = false,
  });

  Future<void> _launch(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw Exception('Could not launch $uri');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: MyApp.languageNotifier,
      builder: (context, lang, _) {
        final width = MediaQuery.of(context).size.width;
        final isMobile = width < 600;
        final isEnglish = lang == 'en';

        return Card(
          elevation: isFeatured ? 8 : 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side:
                isFeatured
                    ? BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                      width: 1.5,
                    )
                    : BorderSide.none,
          ),
          child: InkWell(
            onTap: null,
            borderRadius: BorderRadius.circular(12),
            child: Column(
              children: [
                // Image section with fixed height
                AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(12),
                          ),
                          image: DecorationImage(
                            image:
                                isAssetImage
                                    ? AssetImage(imageUrl) as ImageProvider
                                    : NetworkImage(imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),

                      if (isFeatured)
                        Positioned(
                          top: 10,
                          left: 10,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: bhsText(
                              context: context,
                              en: '⭐ FEATURED PROJECT',
                              id: '⭐ PROYEK UNGGULAN',
                              style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                // Content section
                Padding(
                  padding: EdgeInsets.all(isMobile ? 12 : 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min, // 🔥 KUNCI ANTI OVERFLOW
                    children: [
                      // Title
                      Text(
                        EnIdTitle(context, title),
                        style: TextStyle(
                          fontSize: isMobile ? 12 : 14,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 8),
                      // Description
                      ConstrainedBox(
                        constraints: BoxConstraints(
                          maxHeight: isMobile ? 48 : 72,
                        ),
                        child: Text(
                          EnIdDesc(context, description),
                          maxLines: isMobile ? 3 : 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: isMobile ? 10 : 12,
                            color: Colors.grey[600],
                            height: 1.5, // line height biar rapi
                          ),
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children:
                            technologies
                                .map((tech) => TechBadge(label: tech))
                                .toList(),
                      ),
                      const SizedBox(height: 13),

                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          ProjectActionButton(
                            label: 'GitHub',
                            icon: Icons.code,
                            onPressed: () => _launch(githubUrl),
                          ),

                          if (demoUrl != null && demoType != DemoType.none)
                            ProjectActionButton(
                              label:
                                  demoType == DemoType.video
                                      ? (isEnglish
                                          ? 'Demo Video'
                                          : 'Video Demo')
                                      : (isEnglish
                                          ? 'Demo Web'
                                          : 'Lihat Website'),
                              icon:
                                  demoType == DemoType.video
                                      ? Icons.play_circle_outline
                                      : Icons.open_in_browser,
                              onPressed: () => _launch(demoUrl!),
                            ),

                          if (downloadUrl != null && downloadUrl!.isNotEmpty)
                            ProjectActionButton(
                              label:
                                  MyApp.languageNotifier.value == 'en'
                                      ? 'Download'
                                      : 'Unduh',

                              icon: Icons.download,
                              onPressed: () async {
                                final Uri uri = Uri.parse(downloadUrl!);

                                if (await launchUrl(
                                  uri,
                                  mode: LaunchMode.externalApplication,
                                )) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        MyApp.languageNotifier.value == 'en'
                                            ? 'Failed to Download Application'
                                            : 'Gagal Mengunduh Aplikasi.',
                                      ),
                                      backgroundColor: Colors.red,
                                    ),
                                  );
                                }
                              },
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class TechBadge extends StatelessWidget {
  final String label;

  const TechBadge({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color:
            isDark
                ? Theme.of(context).colorScheme.primary.withOpacity(0.2)
                : Theme.of(context).colorScheme.primary.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.3),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }
}

class ProjectActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const ProjectActionButton({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
      valueListenable: MyApp.languageNotifier,
      builder: (context, lang, _) {
        final colorScheme = Theme.of(context).colorScheme;
        final isDark = Theme.of(context).brightness == Brightness.dark;

        return OutlinedButton.icon(
          onPressed: onPressed,
          icon: Icon(icon, size: 16, color: colorScheme.primary),
          label: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: colorScheme.primary,
            ),
          ),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
            side: BorderSide(
              color: colorScheme.primary.withOpacity(isDark ? 0.6 : 0.8),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        );
      },
    );
  }
}

class HoverCard extends StatefulWidget {
  final Widget child;

  const HoverCard({super.key, required this.child});

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return MouseRegion(
      onEnter: (_) {
        if (isDesktop) setState(() => _isHovered = true);
      },
      onExit: (_) {
        if (isDesktop) setState(() => _isHovered = false);
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        transform:
            _isHovered
                ? (Matrix4.identity()..translate(0, -8))
                : Matrix4.identity(),
        child: AnimatedScale(
          scale: _isHovered ? 1.02 : 1.0,
          duration: const Duration(milliseconds: 200),
          child: widget.child,
        ),
      ),
    );
  }
}

class ProjectsHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 90;

  @override
  double get maxExtent => 90;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Theme.of(context);

    return Container(
      color: theme.scaffoldBackgroundColor,
      padding: const EdgeInsets.fromLTRB(2, 0, 24, 12),
      alignment: Alignment.bottomLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          bhsText(
            context: context,
            en: 'My Project',
            id: 'Proyek saya',
            style: theme.textTheme.headlineLarge?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          bhsText(
            context: context,
            en: 'Selected works and their applications',
            id: 'Karya-karya terpilih dan penerapannya',
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.grey),
          ),
        ],
      ),
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

String EnIdTitle(BuildContext context, String text) {
  final isEnglish = MyApp.languageNotifier.value == 'en';

  if (isEnglish) return text;

  const Map<String, String> idMap = {
    'CRYPTO - APP': 'CRYPTO - APLIKASI',
    'Khodam Check Application (.exe)': 'Aplikasi Cek Khodam (.exe)',
    'Book Management Application': 'Aplikasi Pengelola Buku',
    'Digital Solutions Application Techlogo Profile Website':
        'Website Profil Perusahaan Techlogo Digital Solutions',
    'Smart Calculator for Calculating Good Deeds':
        'Kalkulator Cerdas Perhitungan Amal',
  };

  return idMap[text] ?? text;
}

String EnIdDesc(BuildContext context, String text) {
  final isEnglish = MyApp.languageNotifier.value == 'en';

  if (isEnglish) return text;

  const Map<String, String> idMap = {
    'A Java-based desktop file security application that encrypts and decrypts files using the Advanced Encryption Standard (AES) algorithm in CBC mode, and password protection using BCrypt. It features user management, logging, and encryption performance statistics.':
        'Aplikasi keamanan file berbasis Java Desktop yang melakukan enkripsi dan dekripsi menggunakan algoritma AES mode CBC serta proteksi password BCrypt. Dilengkapi manajemen user, logging, dan statistik performa enkripsi.',

    'The Khodam Check app is an interactive tool that allows you to check the presence and type of khodam that may be accompanying you. With a user-friendly interface and the latest Electron technology, this app offers an entertaining experience for users interested in the mystical world.':
        'Aplikasi Cek Khodam adalah alat interaktif untuk mengecek keberadaan dan jenis khodam. Dibangun dengan Electron dan antarmuka ramah pengguna untuk pengalaman yang menghibur.',

    'The Book Management application is a Java-based desktop application designed to help manage book data neatly, quickly, and in a structured manner. This application is suitable for use by schools, school cooperatives, book warehouse administrators, and administrative staff who need an easy-to-use bookkeeping system.':
        'Aplikasi Pengelola Buku berbasis Java Desktop untuk mengelola data buku secara rapi dan terstruktur. Cocok untuk sekolah, koperasi, admin gudang, dan staff tata usaha.',

    'TechLogo Nexus is a modern company profile website designed to represent an IT & Digital Solutions company. This project showcases a clean UI, responsive layout, and interactive features using HTML, CSS, and JavaScript.':
        'TechLogo Nexus adalah website company profile modern untuk perusahaan IT & Digital Solutions dengan UI clean, layout responsif, dan fitur interaktif berbasis HTML, CSS, dan JavaScript.',

    'A pure HTML, CSS, and JavaScript-based calculator application designed to help users calculate their Zakat al-Mal, Zakat al-Fitr, and Infaq obligations quickly, accurately, and completely offline. This application is ideal for personal use, community use, or religious institutions like mosques, as it does not require a backend or internet connection.':
        'Aplikasi kalkulator berbasis HTML, CSS, dan JavaScript untuk menghitung Zakat Mal, Zakat Fitrah, dan Infaq secara cepat dan offline tanpa backend.',
  };

  return idMap[text] ?? text;
}
