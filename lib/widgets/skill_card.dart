import 'package:flutter/material.dart';
import 'package:my_portfolio/models/skill.dart';

class SkillCard extends StatelessWidget {
  final Skill skill;
  const SkillCard({super.key, required this.skill});

  @override
  Widget build(BuildContext context) {
    // colors
    final bg = Theme.of(context).cardColor;
    final border = Colors.grey.shade800;
    final textGray = Colors.grey.shade300;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: bg,
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: border),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.35),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Row(
            children: [
              // icon box
              Container(
                width: 72,
                height: 72,
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: skill.color.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey.shade800),
                ),
                child: Center(child: Image.asset(skill.image)),
              ),

              const SizedBox(width: 18),

              // content
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // title + tag
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            skill.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: skill.color.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text(
                            skill.tag,
                            style: TextStyle(
                              color: skill.color.withOpacity(0.95),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      skill.desc,
                      style: TextStyle(fontSize: 14, color: textGray),
                    ),
                    const Spacer(),
                    Text(
                      'Proficiency Level',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey.shade400,
                      ),
                    ),
                    const SizedBox(height: 6),
                    // progress bar container (rounded)
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Container(
                        height: 10,
                        color: Colors.grey.shade800,
                        child: Stack(
                          children: [
                            FractionallySizedBox(
                              alignment: Alignment.centerLeft,
                              widthFactor: skill.percent / 100,
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      skill.color,
                                      skill.color.withOpacity(0.85),
                                    ],
                                  ),
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
        ),

        // percentage pill top-right
        Positioned(
          right: 10,
          top: -6,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: skill.color,
              borderRadius: BorderRadius.circular(24),
              boxShadow: [
                BoxShadow(
                  color: skill.color.withOpacity(0.35),
                  blurRadius: 12,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: Text(
              '${skill.percent}%',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
