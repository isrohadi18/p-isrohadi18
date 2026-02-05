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
    final crossAxisCount = width < 600 ? 1 : width < 900 ? 2 : 3;

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
          ).animate()
            .fadeIn(duration: 600.ms)
            .slideX(begin: -0.2),
          SizedBox(height: width < 600 ? 20 : 30),
          Expanded(
            child: GridView.count(
              physics: const ClampingScrollPhysics(),
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: width < 600 ? 16 : 20,
              mainAxisSpacing: width < 600 ? 16 : 20,
              childAspectRatio: width < 600 ? 0.8 : 1.0, // Adjusted ratio
              children: [
                ProjectCard(
                  title: 'Sistem Pengajuan PKN (Praktek Kerja Nyata)',
                  description: 'Sistem pengajuan PKN (Praktek Kerja Nyata) menggunakan koneksi Database mySql sebagai tempat penyimpanan data user ataupun inputan user',
                  technologies: ['Java', 'Mysql'],
                  imageUrl: 'assets/images/proyek1.png',
                  projectUrl: 'https://github.com/Rysalb/TubesPbo',
                  isAssetImage: true,
                ),
                ProjectCard(
                  title: 'Ladangku.id',
                  description: 'Ladangku.id is a web-based application that provides a platform for farmers to sell their products online.',
                  technologies: ['HTML', 'CSS'],
                  imageUrl: 'assets/images/proyek2.png',
                  projectUrl: 'https://github.com/Rysalb/Ladangku-UI',
                  isAssetImage: true,
                ),
                ProjectCard(
                  title: 'Aplikasi Sistem Manajemen Kos',
                  description: 'Aplikasi manajemen kos adalah solusi digital untuk mengelola operasional kos secara efisien. Aplikasi ini terdiri dari dua platform: backend menggunakan Laravel dan frontend menggunakan Flutter.',
                  technologies: ['Flutter', 'Laravel', 'MySQL'],
                  imageUrl: 'assets/images/proyek3.png',
                  projectUrl: 'https://github.com/Rysalb/fe_kos_hansarin',
                  isAssetImage: true,
                ),
              ].mapIndexed((index, card) => card.animate(
                delay: (200 * index).ms)
                .fadeIn()
                .slideY(begin: 0.2)
                .scale(begin: const Offset(0.8, 0.8))
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final String title;
  final String description;
  final List<String> technologies;
  final String imageUrl;
  final String projectUrl;
  final bool isAssetImage;

  const ProjectCard({
    super.key,
    required this.title,
    required this.description,
    required this.technologies,
    required this.imageUrl,
    required this.projectUrl,
    this.isAssetImage = false,
  });

  Future<void> _launchUrl() async {
    final Uri url = Uri.parse(projectUrl);
    if (!await launchUrl(url)) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isMobile = width < 600;
    
    return Card(
      elevation: 4,
      color: Theme.of(context).cardColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: _launchUrl,
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            // Image section with fixed height
            AspectRatio(
              aspectRatio: 16 / 9,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  image: DecorationImage(
                    image: isAssetImage 
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
                    const SizedBox(height: 4),
                    // Description
                    Expanded(
                      child: Text(
                        description,
                        style: TextStyle(
                          fontSize: isMobile ? 10 : 12,
                          color: Colors.grey[600],
                        ),
                        maxLines: isMobile ? 3 : 4,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 4),
                    // Technologies
                    SizedBox(
                      height: 24,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        children: technologies.map((tech) => Padding(
                          padding: const EdgeInsets.only(right: 4),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              tech,
                              style: TextStyle(
                                fontSize: isMobile ? 9 : 10,
                                color: Theme.of(context).colorScheme.primary,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        )).toList(),
                      ),
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