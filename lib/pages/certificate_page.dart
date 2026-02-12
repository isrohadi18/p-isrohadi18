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

  // DATA CERTIFICATE
  static final List<CertificateModel> certificates = [
    CertificateModel(
      title: 'Intro to Software Engineering',
      organization: 'Coding Camp RevoU',
      year: 'Diterbitkan pada 16 January 2026',
      credentialUrl:
          'https://drive.google.com/file/d/1S9soCji_UqqfNxWAV1Bvlyp4_bOX2q0i/view?usp=sharing',
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

  @override
  Widget build(BuildContext context) {
    final filteredCertificates =
        selectedSkill == 'All'
            ? certificates
            : certificates
                .where((c) => c.skills.contains(selectedSkill))
                .toList();

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionTitle(
              title: 'Certificates',
              subtitle: 'Credentials and professional certifications',
            ),

            const SizedBox(height: 24),

            Wrap(
              spacing: 8,
              children:
                  ['All', 'Flutter', 'Security'].map((skill) {
                    final isActive = selectedSkill == skill;
                    return ChoiceChip(
                      label: Text(skill),
                      selected: isActive,
                      onSelected: (_) {
                        setState(() {
                          selectedSkill = skill;
                          expandedIndex =
                              null; // reset expand saat filter berubah
                        });
                      },
                    );
                  }).toList(),
            ),
            const SizedBox(height: 24),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: filteredCertificates.length,
              itemBuilder: (context, index) {
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
                      expandedIndex = expandedIndex == index ? null : index;
                    });
                  },
                );
              },
            ),
          ],
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

class CertificateCard extends StatelessWidget {
  final String title;
  final String organization;
  final String year;
  final String? credentialUrl;
  final List<String> skills;
  final String insight;
  final bool isExpanded;
  final VoidCallback onTap;

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
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: InkWell(
        onTap: onTap,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 8),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey.shade300),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // HEADER
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Icon(isExpanded ? Icons.expand_less : Icons.expand_more),
                  ],
                ),
                const SizedBox(height: 6),
                Text(
                  organization,
                  style: TextStyle(color: Colors.grey.shade700),
                ),
                const SizedBox(height: 4),
                Text(year, style: TextStyle(color: Colors.grey.shade500)),

                // EXPANDED CONTENT
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 12),

                      // SKILLS
                      if (skills.isNotEmpty)
                        Wrap(
                          spacing: 8,
                          children:
                              skills
                                  .map(
                                    (skill) => Chip(
                                      label: Text(skill),
                                      backgroundColor: Colors.grey.shade100,
                                    ),
                                  )
                                  .toList(),
                        ),

                      const SizedBox(height: 10),
                      Text(insight),

                      if (credentialUrl != null)
                        TextButton.icon(
                          onPressed: () async {
                            final uri = Uri.parse(credentialUrl!);
                            if (await canLaunchUrl(uri)) {
                              await launchUrl(
                                uri,
                                mode: LaunchMode.externalApplication,
                              );
                            }
                          },
                          icon: const Icon(Icons.open_in_new),
                          label: const Text('View Credential'),
                        ),
                    ],
                  ),
                  crossFadeState:
                      isExpanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 250),
                ),
              ],
            ),
          ),
        ),
      ),
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

class ExperienceHeaderDelegate extends SliverPersistentHeaderDelegate {
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
      padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
      alignment: Alignment.bottomLeft,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'Experience',
            style: theme.textTheme.headlineLarge?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            'Professional background and roles',
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
