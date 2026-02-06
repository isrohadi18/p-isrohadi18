import 'package:flutter/material.dart';

class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SectionTitle(
            title: 'Experience',
            subtitle: 'Professional experience and practical impact.',
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
        ],
      ),
    );
  }
}

class SectionTitle extends StatefulWidget {
  final String title;
  final String subtitle;

  const SectionTitle({super.key, required this.title, required this.subtitle});

  @override
  State<SectionTitle> createState() => _SectionTitleState();
}

class _SectionTitleState extends State<SectionTitle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _opacity;
  late Animation<Offset> _slide;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    );

    _opacity = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _slide = Tween<Offset>(
      begin: const Offset(0, 0.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _opacity,
      child: SlideTransition(
        position: _slide,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.title,
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.subtitle,
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildTitle() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: const [
      Text(
        'Experience',
        style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
      ),
      SizedBox(height: 8),
      Text(
        'Professional experience and practical impact.',
        style: TextStyle(fontSize: 16, color: Colors.grey),
      ),
    ],
  );
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
      'Tech: Flutter, Dart, Git',
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
      'Tech: Java, Flutter, AES, Git',
    ],
  ),
];

class ExperienceCard extends StatefulWidget {
  final Experience experience;

  const ExperienceCard({super.key, required this.experience});

  @override
  State<ExperienceCard> createState() => _ExperienceCardState();
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          const SizedBox(height: 16),
          Text(
            experience.role,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 12),
          ...experience.highlights.map(
            (item) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [const Text('•  '), Expanded(child: Text(item))],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        CircleAvatar(radius: 18, backgroundImage: AssetImage(experience.logo)),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            experience.company,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
        Text(
          experience.period,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ],
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Timeline indicator
        Column(
          children: [
            Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
            ),
            if (!isLast)
              Container(width: 2, height: 120, color: Colors.grey.shade300),
          ],
        ),
        const SizedBox(width: 24),

        // Card
        Expanded(child: ExperienceCard(experience: experience)),
      ],
    );
  }
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(radius: 18, backgroundImage: AssetImage(exp.logo)),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    exp.company,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  exp.period,
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text(
              exp.role,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            ...exp.highlights.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [const Text('•  '), Expanded(child: Text(item))],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
