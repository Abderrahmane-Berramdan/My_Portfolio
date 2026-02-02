import 'package:flutter/material.dart';
import 'package:my_portfolio/models/project.dart';
import 'package:my_portfolio/widgets/project_card.dart';

class ProjectsGrid extends StatelessWidget {
  final List<Project> projects;
  const ProjectsGrid({super.key, required this.projects});

  int _calculateCrossAxisCount(double width) {
    if (width >= 1200) return 3;
    if (width >= 900) return 3;
    if (width >= 700) return 2;
    return 1;
  }

  double _calculateChildAspect(double width) {
    // Adjust card height vs width so the UI looks balanced
    if (width >= 1200) return 0.75;
    if (width >= 900) return 0.78;
    if (width >= 700) return 0.9;
    return 1.05;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final crossAxisCount = _calculateCrossAxisCount(width);
        final childAspect = _calculateChildAspect(width);

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
            return ProjectCard(project: p);
          },
        );
      },
    );
  }
}
