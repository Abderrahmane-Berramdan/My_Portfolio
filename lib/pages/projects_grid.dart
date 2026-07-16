import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/scroll_reveal.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/widgets/project_card.dart';

class ProjectsGrid extends StatelessWidget {
  final List<Project> projects;
  const ProjectsGrid({super.key, required this.projects});

  int _calculateCrossAxisCount(double width) {
    if (width >= 1200) return 3;
    if (width >= 900) return 2;
    if (width >= 700) return 2;
    return 1;
  }

  double _calculateChildAspect(double width) {
    // Adjust card height vs width so the UI looks balanced
    if (width >= 1200) return 0.6;
    if (width >= 900) return 0.66;
    if (width >= 700) return 0.58;
    if (width >= 500) return 0.73;
    return 0.65;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final crossAxisCount = _calculateCrossAxisCount(width);
        final childAspect = _calculateChildAspect(width);
        print("$width👌👌👌👌❌");
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: childAspect,
          ),
          itemCount: projects.length,
          itemBuilder: (context, index) {
            final p = projects[index];
            return ScrollReveal(
              duration: const Duration(milliseconds: 600),
              delay: Duration(milliseconds: 150 * index),
              child: ProjectCard(project: p),
            );
          },
        );
      },
    );
  }
}
