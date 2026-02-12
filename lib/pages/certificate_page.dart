import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class CertificatePage extends StatefulWidget {
  const CertificatePage({super.key});

  @override
  State<CertificatePage> createState() => _CertificatePageState();
}

class _CertificatePageState extends State<CertificatePage> {
  int? expandedIndex;
  String selectedSkill = 'All';

  int get newestIndex {
    int latestYear = 0;
    int index = 0;

    for (int i = 0; i < certificates.length; i++) {
      final yearMatch = RegExp(r'\d{4}').firstMatch(certificates[i].year);
      if (yearMatch != null) {
        final year = int.parse(yearMatch.group(0)!);
        if (year > latestYear) {
          latestYear = year;
          index = i;
        }
      }
    }
    return index;
  }

  final Map<String, List<String>> categoryMap = {
    'Software Engineering': ['HTML', 'CSS', 'Javascript', 'Github', 'Git'],
    'UI/UX & Product Design': ['Figma', 'UI Design Principles', 'UX Thinking'],
    'Cyber Security': [
      'OSINT Fundamentals',
      'Security-Oriented Mindset',
      'Basic Penetration Testing',
      'Cyber Law Awarenes',
    ],
    'Network Engineering': [
      'Cisco CLI',
      'IP Addres',
      'LAN Network Settings',
      'Router',
      'Switch',
      'Mikrotik',
      'Subnetting',
    ],
  };

  int categoryCount(String category) {
    if (category == 'All') return certificates.length;

    if (category == 'General') {
      return certificates.where((cert) {
        return !categoryMap.values
            .expand((skills) => skills)
            .toSet()
            .intersection(cert.skills.toSet())
            .isNotEmpty;
      }).length;
    }

    final categorySkills = categoryMap[category] ?? [];

    return certificates.where((cert) {
      return cert.skills.any((skill) => categorySkills.contains(skill));
    }).length;
  }

  // DATA CERTIFICATE
  static final List<CertificateModel> certificates = [
    CertificateModel(
      title: 'Intro to Software Engineering',
      organization: 'Coding Camp RevoU',
      year: 'Diterbitkan pada 16 January 2026',
      credentialUrl:
          'https://drive.google.com/file/d/1MoWcQGvNhktSTWhDkrpXVDc_Mg3sq81D/view?usp=drive_link',
      skills: ['HTML', 'CSS', 'Javascript', 'Github', 'Git'],
      insight:
          'Melalui program ini, saya membangun fondasi kuat dalam pengembangan perangkat lunak. Saya tidak hanya belajar cara menulis kode, tetapi juga memahami bagaimana sebuah aplikasi dirancang, dikembangkan, dan dikelola secara terstruktur. Program ini membentuk pola pikir saya sebagai seorang problem solver yang sistematis, bukan sekadar coder.',
    ),
    CertificateModel(
      title: 'Membentuk Pribadi Cerdas Digital',
      organization: 'Kominfo',
      year: 'Diterbitkan pada 29 July 2023',
      credentialUrl:
          'https://drive.google.com/file/d/1iIdkyOPowq-43auhkO_5MlFJAxDUX7tV/view?usp=drive_link',
      skills: [
        'Digital Ethics',
        'Cyber Awareness',
        'Data Privacy Fundamentals',
      ],
      insight:
          'Program ini memperkuat pemahaman saya tentang pentingnya etika dan tanggung jawab dalam dunia digital. Saya belajar bahwa teknologi bukan hanya soal kemampuan teknis, tetapi juga tentang bagaimana menggunakannya secara aman, bijak, dan profesional.',
    ),
    CertificateModel(
      title: 'Mengenal Profesi IT Dan Hukum Cyber',
      organization: 'Universitas Pancasila',
      year: 'Diterbitkan pada 14 July 2022',
      credentialUrl:
          'https://drive.google.com/file/d/1i7J5L0gpBu9k6j39Y6596FYGe2Cd6qtZ/view?usp=drive_link',
      skills: [
        'Cyber Law Awarenes',
        'IT Compliance',
        'Legal Risk Awareness in Digital Systems',
      ],
      insight:
          'Sertifikat ini memberikan perspektif bahwa dunia IT selalu berjalan berdampingan dengan regulasi dan hukum. Saya memahami pentingnya kepatuhan terhadap aturan dalam pengembangan dan penggunaan sistem digital, terutama terkait keamanan data dan hukum siber.',
    ),
    CertificateModel(
      title: 'Improve Your Portofolio With UI/UX Design Trend',
      organization: 'Hima If X Buildwith Angga',
      year: 'Diterbitkan pada 31 October 2021',
      credentialUrl:
          'https://drive.google.com/file/d/17b2WewXQvUvVOHDUJVbVqCA8iKFufkFC/view?usp=drive_link',
      skills: ['Figma', 'UI Design Principles', 'UX Thinking'],
      insight:
          'Melalui program ini, saya belajar melihat sebuah produk dari sudut pandang pengguna. Saya memahami bahwa sistem yang baik bukan hanya berjalan dengan benar, tetapi juga harus nyaman dan mudah digunakan. Hal ini membantu saya menjadi developer yang lebih berorientasi pada pengalaman pengguna.',
    ),
    CertificateModel(
      title: 'Performance Reconnaissance For Ethical Hacking',
      organization: 'PT XAI SYNDICATE INTERNASIONAL',
      year: 'Diterbitkan pada 26 September 2021',
      credentialUrl:
          'https://drive.google.com/file/d/1VF962b67pUe-nK3IzsrsVe8gfG2Elkml/view?usp=drive_link',
      skills: [
        'OSINT Fundamentals',
        'Security-Oriented Mindset',
        'Basic Penetration Testing',
      ],
      insight:
          'Program ini memperkenalkan saya pada tahap awal penetration testing, khususnya dalam proses reconnaissance. Saya memahami bagaimana sebuah sistem dapat dianalisis dari sudut pandang keamanan, serta pentingnya membangun aplikasi dengan mindset security-first.',
    ),
    CertificateModel(
      title: 'Konfigurasi Cisco Router untuk CCNA',
      organization: 'Skill Academy By Ruangguru',
      year: 'Diterbitkan pada 03 December 2020',
      credentialUrl:
          'https://drive.google.com/file/d/1jt7nVCSNLcwAJNx_ii55bTOU3gh0fmJP/view?usp=drive_link',
      skills: [
        'Cisco CLI',
        'IP Addres',
        'Basic Routing Configuration',
        'Subnetting',
      ],
      insight:
          'Melalui pelatihan ini, saya mempelajari dasar konfigurasi perangkat jaringan, khususnya Cisco router. Saya memahami bagaimana jaringan dirancang, dikonfigurasi, dan dioptimalkan untuk memastikan komunikasi data berjalan dengan baik.',
    ),
    CertificateModel(
      title: 'Sukses Interview/ Wawancara Kerja',
      organization: 'Skill Academy By Ruangguru',
      year: 'Diterbitkan pada 01 December 2020',
      credentialUrl:
          'https://drive.google.com/file/d/13Ogtb9ddT2zN-QIoO7xYyAa1UvribUz5/view?usp=drive_link',
      skills: [
        'Communication Skill',
        'Personal Branding',
        'Behavioral Interview Strategy',
        'Confidence Building',
        'CV Optimization',
      ],
      insight:
          'Program ini membantu saya mempersiapkan diri secara profesional untuk menghadapi dunia kerja. Saya belajar menyampaikan kemampuan dan pengalaman secara terstruktur serta membangun komunikasi yang lebih percaya diri.',
    ),
    CertificateModel(
      title: 'Computer and Network Engineering Qualification II',
      organization: 'Badan Nasional Sertifikasi Profesi',
      year: 'Diterbitkan pada December 2019',
      credentialUrl:
          'https://drive.google.com/file/d/1S9soCji_UqqfNxWAV1Bvlyp4_bOX2q0i/view?usp=sharing',
      skills: [
        'LAN Network Settings',
        'Mikrotik',
        'IP Addressing Configuration',
        'Router',
        'Switch',
      ],
      insight:
          'Sertifikasi ini merupakan validasi kompetensi teknis saya di bidang komputer dan jaringan sesuai standar nasional. Proses asesmen memastikan bahwa kemampuan saya tidak hanya berbasis teori, tetapi juga praktik langsung di lapangan.',
    ),
  ];

  List<String> get allSkills {
    final skills = certificates.expand((c) => c.skills).toSet().toList();

    skills.sort();
    return ['All', ...skills];
  }

  int skillCount(String skill) {
    if (skill == 'All') return certificates.length;
    return certificates.where((c) => c.skills.contains(skill)).length;
  }

  final List<String> categories = [
    'All',
    'Software Engineering',
    'UI/UX & Product Design',
    'Cyber Security',
    'Network Engineering',
    'General',
  ];

  @override
  Widget build(BuildContext context) {
    final filteredCertificates =
        selectedSkill == 'All'
            ? certificates
            : selectedSkill == 'General'
            ? certificates.where((cert) {
              return !categoryMap.values
                  .expand((skills) => skills)
                  .toSet()
                  .intersection(cert.skills.toSet())
                  .isNotEmpty;
            }).toList()
            : certificates.where((cert) {
              final categorySkills = categoryMap[selectedSkill] ?? [];
              return cert.skills.any((skill) => categorySkills.contains(skill));
            }).toList();

    return CustomScrollView(
      slivers: [
        /// 🔥 Sticky Header (Pakai Delegate yang sudah kamu buat)
        SliverPersistentHeader(
          pinned: true,
          delegate: CertificateHeaderDelegate(),
        ),

        /// 🔹 Filter Section
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// 🔹 FILTER CHIP
                Wrap(
                  spacing: 10,
                  runSpacing: 8,
                  children:
                      categories.map((category) {
                        final isActive = selectedSkill == category;

                        return ChoiceChip(
                          label: Text('$category (${categoryCount(category)})'),
                          selected: isActive,
                          onSelected: (_) {
                            setState(() {
                              selectedSkill = category;
                              expandedIndex = null;
                            });
                          },
                        );
                      }).toList(),
                ),

                const SizedBox(height: 24),

                /// 🔹 LIST
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  transitionBuilder: (child, animation) {
                    return FadeTransition(
                      opacity: animation,
                      child: SlideTransition(
                        position: Tween<Offset>(
                          begin: const Offset(0, 0.05),
                          end: Offset.zero,
                        ).animate(animation),
                        child: child,
                      ),
                    );
                  },
                  child: Column(
                    key: ValueKey(selectedSkill),
                    children: List.generate(filteredCertificates.length, (
                      index,
                    ) {
                      final cert = filteredCertificates[index];

                      return CertificateCard(
                            title: cert.title,
                            organization: cert.organization,
                            year: cert.year,
                            credentialUrl: cert.credentialUrl,
                            skills: cert.skills,
                            insight: cert.insight,
                            isExpanded: expandedIndex == index,
                            onTap: () {
                              setState(() {
                                expandedIndex =
                                    expandedIndex == index ? null : index;
                              });
                            },
                            isNewest: index == newestIndex,
                          )
                          .animate(delay: (500 * index).ms)
                          .fadeIn(duration: 400.ms)
                        ..slideY(begin: 0.08, curve: Curves.easeOutCubic);
                    }),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class CertificateCard extends StatefulWidget {
  final String title;
  final String organization;
  final String year;
  final String? credentialUrl;
  final List<String> skills;
  final String insight;
  final bool isExpanded;
  final VoidCallback onTap;
  final bool isNewest;

  const CertificateCard({
    super.key,
    required this.title,
    required this.organization,
    required this.year,
    this.credentialUrl,
    this.skills = const [],
    required this.insight,
    required this.isExpanded,
    required this.onTap,
    this.isNewest = false,
  });

  @override
  State<CertificateCard> createState() => _CertificateCardState();
}

class _CertificateCardState extends State<CertificateCard> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDesktop = MediaQuery.of(context).size.width > 800;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        if (isDesktop) setState(() => isHovered = true);
      },
      onExit: (_) {
        if (isDesktop) setState(() => isHovered = false);
      },
      child: InkWell(
        onTap: widget.onTap,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: const EdgeInsets.all(20),
          transform:
              isHovered
                  ? (Matrix4.identity()..translate(0, -6))
                  : Matrix4.identity(),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: theme.cardColor,
            border: Border.all(
              color: isHovered ? theme.colorScheme.primary : theme.dividerColor,
            ),
            boxShadow:
                isHovered
                    ? [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.08),
                        blurRadius: 14,
                        offset: const Offset(0, 6),
                      ),
                    ]
                    : [],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      widget.title,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  if (widget.isNewest)
                    Container(
                      margin: const EdgeInsets.only(left: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        'NEW',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                  AnimatedRotation(
                    turns: widget.isExpanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: const Icon(Icons.expand_more),
                  ),
                ],
              ),
              const SizedBox(height: 5),

              Text(
                widget.organization,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: Colors.orange.shade400,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              Text(
                widget.year,
                style: theme.textTheme.bodySmall?.copyWith(
                  color: Colors.grey.shade500,
                ),
              ),

              /// 🔥 SMOOTH EXPAND
              AnimatedSize(
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeInOut,
                child:
                    widget.isExpanded
                        ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),

                            if (widget.skills.isNotEmpty)
                              Wrap(
                                spacing: 8,
                                runSpacing: 6,
                                children:
                                    widget.skills
                                        .map(
                                          (skill) => Chip(
                                            label: Text(skill),
                                            backgroundColor: theme
                                                .colorScheme
                                                .primary
                                                .withOpacity(0.08),
                                          ),
                                        )
                                        .toList(),
                              ),

                            const SizedBox(height: 12),

                            Text(
                              widget.insight,
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.justify,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w500,
                                height: 1.6, // line height biar rapi
                              ),
                            ),

                            const SizedBox(height: 18),

                            if (widget.credentialUrl != null)
                              ActionButton(
                                label: 'View Credential',
                                icon: Icons.open_in_new,
                                onPressed: () async {
                                  final uri = Uri.parse(widget.credentialUrl!);
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(
                                      uri,
                                      mode: LaunchMode.externalApplication,
                                    );
                                  }
                                },
                              ),
                          ],
                        )
                        : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
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
          padding: const EdgeInsets.only(left: 8), //
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
          padding: const EdgeInsets.only(left: 8), //
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

class CertificateModel {
  final String title;
  final String organization;
  final String year;
  final String? credentialUrl;
  final List<String> skills;
  final String insight;

  CertificateModel({
    required this.title,
    required this.organization,
    required this.year,
    this.credentialUrl,
    this.skills = const [],
    this.insight = '',
  });
}

class CertificateHeaderDelegate extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 100;

  @override
  double get maxExtent => 100;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        border:
            overlapsContent
                ? Border(
                  bottom: BorderSide(color: theme.dividerColor, width: 0.5),
                )
                : null,
      ),
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
      alignment: Alignment.bottomLeft,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Certificates',
            style: theme.textTheme.headlineLarge?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Credentials and professional certifications',
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

class ActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final VoidCallback onPressed;

  const ActionButton({
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
      icon: Icon(icon, size: 16),
      label: Text(
        label,
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
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
