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
      title: 'Flutter Developer',
      organization: 'Dicoding Indonesia',
      year: '2024',
      credentialUrl: 'https://www.dicoding.com',
      skills: ['Flutter', 'Dart', 'UI/UX'],
      insight:
          'Built responsive Flutter applications and applied clean architecture principles.',
    ),
    CertificateModel(
      title: 'Flutter Developer',
      organization: 'Dicoding Indonesia',
      year: '2024',
      credentialUrl: 'https://www.dicoding.com',
      skills: ['Flutter', 'Dart', 'UI/UX'],
      insight:
          'Built responsive Flutter applications and applied clean architecture principles.',
    ),
    CertificateModel(
      title: 'Cyber Security Fundamental',
      organization: 'Coursera',
      year: '2023',
      credentialUrl: 'https://www.coursera.org',
      skills: ['Security', 'Cryptography', 'Networking'],
      insight:
          'Learned fundamental security concepts including encryption, threats, and risk mitigation.',
    ),
    CertificateModel(
      title: 'Cyber Security Fundamental',
      organization: 'Coursera',
      year: '2023',
      credentialUrl: 'https://www.coursera.org',
      skills: ['Security', 'Cryptography', 'Networking'],
      insight:
          'Learned fundamental security concepts including encryption, threats, and risk mitigation.',
    ),
    CertificateModel(
      title: 'Cyber Security Fundamental',
      organization: 'Coursera',
      year: '2023',
      credentialUrl: 'https://www.coursera.org',
      skills: ['Security', 'Cryptography', 'Networking'],
      insight:
          'Learned fundamental security concepts including encryption, threats, and risk mitigation.',
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
  double get minExtent => 110;

  @override
  double get maxExtent => 140;

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
