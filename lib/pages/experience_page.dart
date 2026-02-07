import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

bool isMobileLayout(BuildContext context) {
  return MediaQuery.of(context).size.width < 768;
}

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = isMobileLayout(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Experience',
            subtitle: 'Professional background and roles',
          ),
          const SizedBox(height: 32),

          ...List.generate(
            experienceList.length,
            (index) =>
                isMobile
                    ? ExperienceCard(experience: experienceList[index])
                    : TimelineItem(
                      experience: experienceList[index],
                      isLast: index == experienceList.length - 1,
                    ),
          ),

          const SizedBox(height: 64), // 🔥 PENTING: ruang akhir
        ],
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
          padding: const EdgeInsets.only(left: 30), //
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
          padding: const EdgeInsets.only(left: 30), //
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

class Experience {
  final String company;
  final String period;
  final String role;
  final String logo;
  final List<String> highlights;

  Experience({
    required this.company,
    required this.period,
    required this.role,
    required this.logo,
    required this.highlights,
  });
}

final List<Experience> experienceList = [
  Experience(
    company: 'Freelance / Personal Project',
    period: 'Jan 2023 – Present',
    role: 'Flutter Developer',
    logo: 'assets/images/company_placeholder.png',
    highlights: [
      'Developed responsive portfolio website using Flutter Web',
      'Implemented clean UI structure and reusable components',
      'Implemented clean UI structure and reusable components',
    ],
  ),

  Experience(
    company: 'xaakn',
    period: 'Jan 2023 – Present',
    role: 'Flutter Developer',
    logo: 'assets/images/company_placeholder.png',
    highlights: [
      'Developed responsive portfolio website using Flutter Web',
      'Implemented clean UI structure and reusable components',
      'Implemented clean UI structure and reusable components',
    ],
  ),

  Experience(
    company: 'Universitas',
    period: '2021 – 2025',
    role: 'Software Engineering Student',
    logo: 'assets/images/company_placeholder.png',
    highlights: [
      'Built academic projects using Java and Flutter',
      'Implemented AES encryption for final project',
      'Implemented AES encryption for final project',
    ],
  ),
];

class ExperienceCard extends StatefulWidget {
  final Experience experience;

  const ExperienceCard({super.key, required this.experience});

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<ExperienceCard> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final exp = widget.experience;

    return MouseRegion(
      onEnter: (_) => setState(() => isHover = true),
      onExit: (_) => setState(() => isHover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform:
            isHover
                ? (Matrix4.identity()..translate(0, -4))
                : Matrix4.identity(),
        margin: const EdgeInsets.only(bottom: 24),
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade300),
          boxShadow:
              isHover
                  ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.08),
                      blurRadius: 16,
                      offset: const Offset(0, 6),
                    ),
                  ]
                  : [],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CompanyAvatar(companyName: exp.company, role: exp.role),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // COMPANY + PERIOD
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          exp.company,
                          style: const TextStyle(
                            fontSize: ExperienceTextStyle.companySize,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Text(
                        exp.period,
                        style: const TextStyle(
                          fontSize: ExperienceTextStyle.periodSize,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 6),

                  // ROLE
                  Text(
                    exp.role,
                    style: const TextStyle(
                      fontSize: ExperienceTextStyle.roleSize,
                      fontWeight: FontWeight.w500,
                    ),
                  ),

                  const SizedBox(height: 12),

                  // HIGHLIGHTS
                  ...exp.highlights.map(
                    (item) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('•  '),
                          Expanded(
                            child: Text(
                              item,
                              style: const TextStyle(
                                fontSize: ExperienceTextStyle.bulletSize,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ).animate(delay: 200.ms).fadeIn(duration: 500.ms).slideY(begin: 0.2),
    );
  }
}

class TimelineItem extends StatelessWidget {
  final Experience experience;
  final bool isLast;

  const TimelineItem({
    super.key,
    required this.experience,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TIMELINE
          Column(
            children: [
              Container(
                width: 18,
                height: 18,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(123, 255, 86, 34),
                  shape: BoxShape.circle,
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(width: 1, color: Colors.grey.shade300),
                ),
            ],
          ),

          const SizedBox(width: 24),

          // CARD
          Expanded(child: ExperienceCard(experience: experience)),
        ],
      ),
    );
  }
}

class CompanyAvatar extends StatelessWidget {
  final String companyName;
  final String role;
  final double size;

  const CompanyAvatar({
    super.key,
    required this.companyName,
    required this.role,
    this.size = 40,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: '$companyName\n$role',
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8),
        ],
      ),
      textStyle: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
        fontSize: 12,
      ),
      child: CircleAvatar(
        radius: size / 2,
        backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        child: Text(
          _getInitial(companyName),
          style: TextStyle(
            fontSize: size / 2,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }

  String _getInitial(String name) {
    return name.isNotEmpty ? name[0].toUpperCase() : '?';
  }
}

class ExperienceTextStyle {
  static const double companySize = 16;
  static const double roleSize = 15;
  static const double periodSize = 14;
  static const double bulletSize = 14;
}
