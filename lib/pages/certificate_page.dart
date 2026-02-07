import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CertificatePage extends StatelessWidget {
  const CertificatePage({super.key});

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
  ];

  @override
  Widget build(BuildContext context) {
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

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: certificates.length,
              itemBuilder: (context, index) {
                final cert = certificates[index];
                return CertificateCard(
                  title: cert.title,
                  organization: cert.organization,
                  year: cert.year,
                  credentialUrl: cert.credentialUrl,
                  skills: cert.skills,
                  insight: cert.insight,
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

class CertificateCard extends StatefulWidget {
  final String title;
  final String organization;
  final String year;
  final String? credentialUrl;
  final List<String> skills;
  final String insight;

  const CertificateCard({
    super.key,
    required this.title,
    required this.organization,
    required this.year,
    this.credentialUrl,
    this.skills = const [],
    required this.insight,
  });

  @override
  State<CertificateCard> createState() => _CertificateCardState();
}

class _CertificateCardState extends State<CertificateCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => setState(() => expanded = !expanded),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
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
                    widget.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Icon(
                  expanded ? Icons.expand_less : Icons.expand_more,
                  color: Colors.grey,
                ),
              ],
            ),
            const SizedBox(height: 6),
            Text(
              widget.organization,
              style: TextStyle(color: Colors.grey.shade700),
            ),
            const SizedBox(height: 4),
            Text(widget.year, style: TextStyle(color: Colors.grey.shade500)),

            // EXPANDED CONTENT
            if (expanded) ...[
              const SizedBox(height: 12),

              // SKILLS
              if (widget.skills.isNotEmpty)
                Wrap(
                  spacing: 8,
                  children:
                      widget.skills.map((skill) {
                        return Chip(
                          label: Text(skill),
                          backgroundColor: Colors.grey.shade100,
                        );
                      }).toList(),
                ),

              const SizedBox(height: 10),

              // INSIGHT
              Text(
                widget.insight,
                style: TextStyle(color: Colors.grey.shade700),
              ),

              const SizedBox(height: 12),

              // CREDENTIAL LINK
              if (widget.credentialUrl != null)
                TextButton.icon(
                  onPressed: () {
                    // nanti bisa pakai url_launcher
                  },
                  icon: const Icon(Icons.open_in_new),
                  label: const Text('View Credential'),
                ),
            ],
          ],
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
