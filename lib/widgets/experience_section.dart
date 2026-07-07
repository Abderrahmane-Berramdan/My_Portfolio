import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:my_portfolio/widgets/scroll_reveal.dart';

class ExperienceItem {
  final String period;
  final String role;
  final String company;
  final String location;
  final List<String> details;

  const ExperienceItem({
    required this.period,
    required this.role,
    required this.company,
    required this.location,
    required this.details,
  });
}

class ExperienceSection extends StatelessWidget {
  final List<ExperienceItem> items = const [
    ExperienceItem(
      period: "2026 (3 month)",
      role: "Flutter Developer (Intern)",
      company: "Big Informatique",
      location: "Annaba, Algeria",
      details: [
        "Refactored and cleaned the codebase to improve readability, maintainability, and overall project structure.",
        "Developed new Flutter UI screens and reusable widgets while following the existing design system.",
        "Debugged and resolved application issues in collaboration with the development team."
      ],
    ),
    ExperienceItem(
      period: "2025 (1 month)",
      role: "Flutter Developer (Intern)",
      company: "Big Informatique",
      location: "Annaba, Algeria",
      details: [
        "Redesigned an existing mobile application to improve its user interface, usability, and overall visual consistency.",
        "Refactored and reorganized the existing codebase to enhance maintainability and code quality.",
        "Developed a Flutter-based QR code scanning application for company invoices to automate data extraction and processing.",
        "Built two implementations of the application: a local version using Sqflite and a cloud-connected version using Firebase."
      ],
    ),
    ExperienceItem(
      period: "2024 (15 days)",
      role: "IT Support (Field Internship)",
      company: "Oran Port",
      location: "Oran, Algeria",
      details: [
        "Troubleshot workstations and field printers; provided on-site technical support to port staff.",
        "Configured basic network setups and monitored device connectivity.",
        "Created a daily troubleshooting checklist that improved first-contact resolution."
      ],
    ),
  ];

  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
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
                    child: TimelineItemWidget(
                      item: items[index],
                      isLast: index == items.length - 1,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TimelineItemWidget extends StatefulWidget {
  final ExperienceItem item;
  final bool isLast;
  const TimelineItemWidget({
    super.key,
    required this.item,
    required this.isLast,
  });

  @override
  State<TimelineItemWidget> createState() => _TimelineItemWidgetState();
}

class _TimelineItemWidgetState extends State<TimelineItemWidget> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Colors.blue;
    
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline indicator line
          Column(
            children: [
              Container(
                width: 16,
                height: 16,
                margin: const EdgeInsets.only(top: 8),
                decoration: BoxDecoration(
                  color: primaryColor,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.white, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: primaryColor.withValues(alpha: 0.5),
                      blurRadius: 8,
                      spreadRadius: 2,
                    ),
                  ],
                ),
              ),
              if (!widget.isLast)
                Expanded(
                  child: Container(
                    width: 3,
                    color: Colors.grey.shade800,
                  ),
                ),
            ],
          ),
          const SizedBox(width: 24),
          // Content Card
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: MouseRegion(
                onEnter: (_) => setState(() => _isHovered = true),
                onExit: (_) => setState(() => _isHovered = false),
                child: AnimatedScale(
                  scale: _isHovered ? 1.02 : 1.0,
                  duration: const Duration(milliseconds: 200),
                  curve: Curves.easeOut,
                  child: Container(
                    padding: const EdgeInsets.all(20),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.item.role,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    "${widget.item.company} | ${widget.item.location}",
                                    style: TextStyle(
                                      color: Colors.grey.shade400,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 12,
                                vertical: 6,
                              ),
                              decoration: BoxDecoration(
                                color: primaryColor.withValues(alpha: 0.15),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                widget.item.period,
                                style: TextStyle(
                                  color: primaryColor.withValues(alpha: 0.95),
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        ...widget.item.details.map((detail) => Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 6.0, right: 8.0),
                                    child: Container(
                                      width: 6,
                                      height: 6,
                                      decoration: BoxDecoration(
                                        color: primaryColor.withValues(alpha: 0.7),
                                        shape: BoxShape.circle,
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      detail,
                                      style: TextStyle(
                                        color: Colors.grey.shade300,
                                        fontSize: 14,
                                        height: 1.4,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
