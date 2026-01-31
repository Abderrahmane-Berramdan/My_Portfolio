import 'package:flutter/material.dart';
import 'package:my_portfolio/models/skill.dart';
import 'package:my_portfolio/widgets/skill_card.dart';

class SkillsPage extends StatelessWidget {
  final List<Skill> skillsList = [
    Skill(
      name: "Flutter",
      desc: "Cross-platform mobile development",
      tag: "Framework",
      percent: 80,
      image: "assets/skills_icons/flutter.png",
      color: Colors.blue,
    ),
    Skill(
      name: 'Dart',
      tag: 'Language',
      desc: 'Modern programming language',
      percent: 80,
      color: const Color(0xFF0288D1),
      image: "assets/skills_icons/dart.png",
    ),
    Skill(
      name: 'Firebase',
      tag: 'Backend',
      desc: 'Backend as a Service platform',
      percent: 65,
      color: const Color(0xFFF6C143),
      image: "assets/skills_icons/firebase1.png",
    ),
    Skill(
      name: 'Python',
      tag: 'Language',
      desc: 'General-purpose programming language',
      percent: 65,
      color: const Color(0xFFF6C143),
      image: "assets/skills_icons/python.png",
    ),
    Skill(
      name: 'SQLite',
      tag: 'Database',
      desc: 'Lightweight embedded relational database',
      percent: 70,
      color: Colors.blue,
      image: "assets/skills_icons/database.png",
    ),
    Skill(
      name: 'API Integration',
      tag: 'Backend',
      desc: 'REST APIs & JSON data integration',
      percent: 75,
      color: Colors.blue,
      image: "assets/skills_icons/api.png",
    ),
    Skill(
      name: 'Git',
      tag: 'Version Control',
      desc: 'Source code management and collaboration',
      percent: 70,
      color: Colors.red,
      image: "assets/skills_icons/git.png",
    ),
  ];
  SkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Skill> list = skillsList;
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
          child: LayoutBuilder(
            builder: (context, constraints) {
              final cols = constraints.maxWidth > 900 ? 2 : 1;
              return Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: GridView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: cols,
                      mainAxisExtent: 200,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 30,
                    ),
                    itemBuilder: (context, index) {
                      final skill = list[index];
                      return SkillCard(skill: skill);
                    },
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
