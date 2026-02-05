// ignore_for_file: deprecated_member_use

import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ProjectsPage extends StatelessWidget {
  const ProjectsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final crossAxisCount =
        width < 600
            ? 1
            : width < 900
            ? 2
            : 3;

    return Container(
      height: MediaQuery.of(context).size.height,
      padding: EdgeInsets.all(width < 600 ? 16 : 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'My Projects',
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: width < 600 ? 24 : 32,
            ),
          ).animate().fadeIn(duration: 600.ms).slideX(begin: -0.2),
          SizedBox(height: width < 600 ? 20 : 30),
          Expanded(
            child: GridView.count(
              physics: const ClampingScrollPhysics(),
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: width < 600 ? 16 : 20,
              mainAxisSpacing: width < 600 ? 16 : 20,
              childAspectRatio: width < 600 ? 0.8 : 1.0, // Adjusted ratio
              children:
                  [
                        ProjectCard(
                          title: 'Sistem Pengajuan PKN (Praktek Kerja Nyata)',
                          description:
                              'Sistem pengajuan PKN (Praktek Kerja Nyata) menggunakan koneksi Database mySql sebagai tempat penyimpanan data user ataupun inputan user',
                          technologies: ['Java', 'Mysql'],
                          imageUrl: 'assets/images/proyek1.png',
                          githubUrl: 'https://github.com/Rysalb/TubesPbo',
                          demoUrl:
                              'https://isrohadi18.github.io/CodingCamp-RohadiDJ/',
                          downloadUrl: '',
                          demoType: DemoType.video,
                          isAssetImage: true,
                        ),
                        ProjectCard(
                          title: 'Ladangku.id',
                          description:
                              'Ladangku.id is a web-based application that provides a platform for farmers to sell their products online.',
                          technologies: ['HTML', 'CSS'],
                          imageUrl: 'assets/images/proyek2.png',
                          githubUrl: 'https://github.com/Rysalb/Ladangku-UI',
                          demoUrl:
                              'https://isrohadi18.github.io/CodingCamp-RohadiDJ/',
                          downloadUrl: '',
                          demoType: DemoType.web,
                          isAssetImage: true,
                        ),
                        ProjectCard(
                          title: 'Aplikasi Sistem Manajemen Kos',
                          description:
                              'Aplikasi manajemen kos adalah solusi digital untuk mengelola operasional kos secara efisien. Aplikasi ini terdiri dari dua platform: backend menggunakan Laravel dan frontend menggunakan Flutter.',
                          technologies: ['Flutter', 'Laravel', 'MySQL'],
                          imageUrl: 'assets/images/proyek3.png',
                          githubUrl:
                              'https://github.com/Rysalb/fe_kos_hansarin',
                          isAssetImage: true,
                        ),
                      ]
                      .mapIndexed(
                        (index, card) => card
                            .animate(delay: (200 * index).ms)
                            .fadeIn()
                            .slideY(begin: 0.2)
                            .scale(begin: const Offset(0.8, 0.8)),
                      )
                      .toList(),
            ),
          ),
        ],
      ),
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
      elevation: 4,
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: InkWell(
        onTap: null,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            // Image section with fixed height
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
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
            ),
            // Content section
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(isMobile ? 8 : 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    SizedBox(
                      height: isMobile ? 14 : 32, // ± 3–5 baris
                      child: Text(
                        description,
                        style: TextStyle(
                          fontSize: isMobile ? 10 : 12,
                          color: Colors.grey[600],
                          height: 1.4, // line height biar rapi
                        ),
                        maxLines: isMobile ? 3 : 5,
                        overflow: TextOverflow.ellipsis,
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

                        if (downloadUrl != null)
                          ProjectActionButton(
                            label: 'Download',
                            icon: Icons.download,
                            onPressed: () => _launch(downloadUrl!),
                          ),
                      ],
                    ),
                  ],
                ),
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
