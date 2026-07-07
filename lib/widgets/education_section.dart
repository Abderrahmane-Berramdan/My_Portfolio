import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:my_portfolio/widgets/scroll_reveal.dart';

class EducationItem {
  final String period;
  final String degree;
  final String institution;
  final String details;

  const EducationItem({
    required this.period,
    required this.degree,
    required this.institution,
    required this.details,
  });
}

class EducationSection extends StatelessWidget {
  final List<EducationItem> items = const [
    EducationItem(
      period: "2023 - 2026",
      degree: "Licence Professionnelle – Mobile Application Development",
      institution: "Ahmed Ben Bella University Oran 1",
      details:
          "Focused on mobile architecture, Flutter application lifecycle, UI design principles, SQLite databases, and REST API integration.",
    ),
  ];

  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: double.infinity,
        height: 390,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
              return ScrollReveal(
                duration: const Duration(milliseconds: 600),
                delay: Duration(milliseconds: 150 * index),
                animationBuilder: (child) => FadeInLeft(
                  duration: const Duration(milliseconds: 600),
                  delay: Duration(milliseconds: 150 * index),
                  child: child,
                ),
                child: SizedBox(
                  width: 400,
                  child: EducationCard(item: items[index]),
                ),
              );
            },
            // children: items.map((item) => EducationCard(item: item)).toList(),
          ),
        ),
      ),
    );
  }
}

class EducationCard extends StatefulWidget {
  final EducationItem item;
  const EducationCard({super.key, required this.item});

  @override
  State<EducationCard> createState() => _EducationCardState();
}

class _EducationCardState extends State<EducationCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Colors.blue;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.04 : 1.02,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        child: Container(
          padding: const EdgeInsets.all(28),
          margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          decoration: BoxDecoration(
            color: const Color(0xff333646).withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Colors.grey.shade800),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final double width = constraints.maxWidth;
              final bool isDesktop = width > 650;

              final Widget badgeWidget = Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withValues(alpha: 0.25),
                      blurRadius: 15,
                      spreadRadius: 2,
                    ),
                  ],
                  gradient: SweepGradient(
                    colors: [
                      primaryColor,
                      Colors.purpleAccent,
                      primaryColor.withValues(alpha: 0.1),
                      primaryColor,
                    ],
                    stops: const [0.0, 0.5, 0.8, 1.0],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff333646),
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.school_rounded,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              );

              final Widget contentWidget = Column(
                spacing: 8,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Text(
                  //   widget.item.period,
                  //   style: TextStyle(
                  //     color: primaryColor,
                  //     fontSize: 16,
                  //     fontWeight: FontWeight.bold,
                  //   ),
                  // ), 
                  // const SizedBox(height: 8),
                  // Text(
                  //   widget.item.degree,
                  //   style: const TextStyle(
                  //     color: Colors.white,
                  //     fontSize: 22,
                  //     fontWeight: FontWeight.bold,
                  //     height: 1.25,
                  //   ),
                  // ),
                  // const SizedBox(height: 6),
                  Text(
                    widget.item.institution,
                    style: TextStyle(
                      color: Colors.grey.shade400,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Row(
                    spacing: 8,
                    children: [
                      Icon(
                        Icons.calendar_today,
                        color: primaryColor,
                        size: 16,
                      ),
                      Text(
                        widget.item.period,
                        style: TextStyle(
                          color: primaryColor,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  // Container(
                  //   width: 60,
                  //   height: 3,
                  //   color: primaryColor,
                  //   margin: const EdgeInsets.symmetric(vertical: 14),
                  // ),
                  Text(
                    widget.item.details,
                    style: TextStyle(
                      color: Colors.grey.shade300,
                      fontSize: 14,
                      height: 1.4,
                    ),
                  ),
                ],
              );

              if (isDesktop) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    badgeWidget,
                    const SizedBox(width: 24),
                    contentWidget,
                  ],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 350,
                      child: Row(
                        spacing: 15,
                        children: [
                          badgeWidget,
                          Expanded(
                            child: Text(
                              widget.item.degree,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    contentWidget,
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
