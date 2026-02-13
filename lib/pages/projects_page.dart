import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';

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
            'Aplikasi keamanan file berbasis Java Desktop yang berfungsi untuk melakukan enkripsi dan dekripsi file menggunakan algoritma AES (Advanced Encryption Standard) dengan mode CBC, serta pengamanan password menggunakan BCrypt. Aplikasi ini dilengkapi dengan manajemen user, logging, dan statistik performa enkripsi.',
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
        title: 'Applikasi Cek Khodam (.exe)',
        description:
            'Applikasi Cek Khodam adalah alat interaktif yang memungkinkan Anda untuk memeriksa keberadaan dan jenis khodam yang mungkin menemani Anda. Dengan antarmuka yang ramah pengguna dan teknologi terkini dari Electron, aplikasi ini menawarkan pengalaman yang menghibur bagi para pengguna yang tertarik dengan dunia mistis. Unduh versi terbaru dari aplikasi Cek Khodam (.exe) dari GitHub CRYEED. Setelah diunduh, buka file .exe, dan saya sebagai pengembang menerima kontribusi dari komunitas untuk meningkatkan aplikasi ini. Jika Anda tertarik untuk berkontribusi, silakan fork repository ini dan kirimkan pull request dengan perubahan yang Anda usulkan. Jika Anda menyukai aplikasi ini dan ingin mendukung pengembangan lebih lanjut',
        technologies: ['HTML', 'CSS', 'JavaScript', 'Electron', 'Node.Js'],
        imageUrl: '../../assets/images/project/khodam.png',
        githubUrl: 'https://github.com/isrohadi18/Khodam-app',
        demoUrl: '',
        demoType: DemoType.web,
        isAssetImage: true,
      ),
      ProjectCard(
        title: 'Aplikasi Pengelola Buku',
        description:
            'Aplikasi Pengelola Buku adalah aplikasi desktop berbasis Java yang dirancang untuk membantu pengelolaan data buku secara rapi, cepat, dan terstruktur. Aplikasi ini cocok digunakan oleh sekolah, koperasi sekolah, admin gudang buku, maupun staff tata usaha yang membutuhkan sistem pencatatan buku yang mudah digunakan.',
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
        title: 'Aplikasi Digital Solutions Techlogo Profile Website',
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
        title: 'Calculator Cerdas Hisab Amal Baik',
        description:
            'Sistem pengajuan PKN menggunakan koneksi Database MySQL sebagai tempat penyimpanan data user ataupun inputan user.',
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
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;

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
                        child: const Text(
                          '⭐ FEATURED PROJECT',
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
                    title,
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
                    constraints: BoxConstraints(maxHeight: isMobile ? 48 : 72),
                    child: Text(
                      description,
                      maxLines: isMobile ? 3 : 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: isMobile ? 10 : 12,
                        color: Colors.grey[600],
                        height: 1.4, // line height biar rapi
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  Wrap(
                    spacing: 6,
                    runSpacing: 6,
                    children:
                        technologies
                            .map((tech) => TechBadge(label: tech))
                            .toList(),
                  ),
                  const SizedBox(height: 8),

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
                                  ? 'Demo Video'
                                  : 'Demo Web',
                          icon:
                              demoType == DemoType.video
                                  ? Icons.play_circle_outline
                                  : Icons.open_in_new,
                          onPressed: () => _launch(demoUrl!),
                        ),

                      if (downloadUrl != null && downloadUrl!.isNotEmpty)
                        ProjectActionButton(
                          label: 'Download',
                          icon: Icons.download,
                          onPressed: () async {
                            final Uri uri = Uri.parse(downloadUrl!);
                            await launchUrl(
                              uri,
                              mode: LaunchMode.externalApplication,
                            );
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
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
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
          Text(
            'My Project',
            style: theme.textTheme.headlineLarge?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Selected works and implementations',
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
