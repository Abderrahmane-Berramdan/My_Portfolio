import 'package:flutter/material.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

// lib/main.dart
// import 'package:flutter/material.dart';

// void main() {
//   runApp(const MyApp());
// }

// class Skill {
//   final String name;
//   final String tag;
//   final String desc;
//   final int percent;
//   final Color accent;
//   final IconData icon;

//   Skill({
//     required this.name,
//     required this.tag,
//     required this.desc,
//     required this.percent,
//     required this.accent,
//     required this.icon,
//   });
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Skills Cards',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData.dark().copyWith(
//         scaffoldBackgroundColor: const Color(0xFF0F1720),
//         cardColor: const Color(0xFF111827),
//         textTheme: ThemeData.dark().textTheme.apply(
//           bodyColor: Colors.white,
//           displayColor: Colors.white,
//         ),
//       ),
//       home: SkillsPage(),
//     );
//   }
// }

// class SkillsPage extends StatelessWidget {
//   SkillsPage({super.key});

//   final List<Skill> skills = [
//     Skill(
//       name: 'Flutter',
//       tag: 'Framework',
//       desc: 'Cross-platform mobile development',
//       percent: 95,
//       accent: const Color(0xFF2B9AF3),
//       icon: Icons.flutter_dash,
//     ),
//     Skill(
//       name: 'Dart',
//       tag: 'Language',
//       desc: 'Modern programming language',
//       percent: 90,
//       accent: const Color(0xFF0288D1),
//       icon: Icons.code,
//     ),
//     Skill(
//       name: 'Firebase',
//       tag: 'Backend',
//       desc: 'Backend as a Service platform',
//       percent: 85,
//       accent: const Color(0xFFF6C143),
//       icon: Icons.cloud,
//     ),
//     Skill(
//       name: 'Supabase',
//       tag: 'Backend',
//       desc: 'Open source Firebase alternative',
//       percent: 85,
//       accent: const Color(0xFF2DD4BF),
//       icon: Icons.storage,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     // convert to mutable list for use in build
//     final List<Skill> list = skills;

//     return Scaffold(
//       body: SafeArea(
//         child: Stack(
//           children: [
//             // decorative blurred circles
//             Positioned(
//               right: -60,
//               top: 80,
//               child: Container(
//                 width: 220,
//                 height: 220,
//                 decoration: BoxDecoration(
//                   gradient: const LinearGradient(
//                     colors: [Color(0xFF3B82F6), Color(0xFF7C3AED)],
//                     begin: Alignment.topLeft,
//                     end: Alignment.bottomRight,
//                   ),
//                   borderRadius: BorderRadius.circular(200),
//                 ),
//                 child: const BackdropFilterLayer(opacity: 0.12),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 20),
//               child: LayoutBuilder(
//                 builder: (context, constraints) {
//                   final cols = constraints.maxWidth > 900 ? 2 : 1;
//                   return Center(
//                     child: ConstrainedBox(
//                       constraints: const BoxConstraints(maxWidth: 1100),
//                       child: GridView.builder(
//                         shrinkWrap: true,
//                         itemCount: list.length,
//                         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                           crossAxisCount: cols,
//                           mainAxisExtent: 200,
//                           crossAxisSpacing: 20,
//                           mainAxisSpacing: 20,
//                         ),
//                         itemBuilder: (context, index) {
//                           final skill = list[index];
//                           return SkillCard(skill: skill);
//                         },
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BackdropFilterLayer extends StatelessWidget {
//   final double opacity;
//   const BackdropFilterLayer({super.key, this.opacity = 0.1});

//   @override
//   Widget build(BuildContext context) {
//     // Simple semi-transparent circle to emulate blur/glow
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(opacity),
//         borderRadius: BorderRadius.circular(200),
//       ),
//     );
//   }
// }

// class SkillCard extends StatelessWidget {
//   final Skill skill;
//   const SkillCard({super.key, required this.skill});

//   @override
//   Widget build(BuildContext context) {
//     // colors
//     final bg = Theme.of(context).cardColor;
//     final border = Colors.grey.shade800;
//     final textGray = Colors.grey.shade300;

//     return Stack(
//       clipBehavior: Clip.none,
//       children: [
//         Container(
//           padding: const EdgeInsets.all(18),
//           decoration: BoxDecoration(
//             color: bg,
//             borderRadius: BorderRadius.circular(16),
//             border: Border.all(color: border),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.35),
//                 blurRadius: 10,
//                 offset: const Offset(0, 6),
//               ),
//             ],
//           ),
//           child: Row(
//             children: [
//               // icon box
//               Container(
//                 width: 72,
//                 height: 72,
//                 decoration: BoxDecoration(
//                   color: const Color(0xFF0B1220),
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: Colors.grey.shade800),
//                 ),
//                 child: Center(
//                   child: Icon(skill.icon, size: 34, color: skill.accent),
//                 ),
//               ),

//               const SizedBox(width: 18),

//               // content
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     // title + tag
//                     Row(
//                       children: [
//                         Expanded(
//                           child: Text(
//                             skill.name,
//                             style: const TextStyle(
//                               fontSize: 20,
//                               fontWeight: FontWeight.w700,
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 8),
//                         Container(
//                           padding: const EdgeInsets.symmetric(
//                             horizontal: 10,
//                             vertical: 6,
//                           ),
//                           decoration: BoxDecoration(
//                             color: skill.accent.withOpacity(0.15),
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Text(
//                             skill.tag,
//                             style: TextStyle(
//                               color: skill.accent.withOpacity(0.95),
//                               fontSize: 12,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     Text(
//                       skill.desc,
//                       style: TextStyle(fontSize: 14, color: textGray),
//                     ),
//                     const Spacer(),
//                     Text(
//                       'Proficiency Level',
//                       style: TextStyle(
//                         fontSize: 12,
//                         color: Colors.grey.shade400,
//                       ),
//                     ),
//                     const SizedBox(height: 6),
//                     // progress bar container (rounded)
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(8),
//                       child: Container(
//                         height: 10,
//                         color: Colors.grey.shade800,
//                         child: Stack(
//                           children: [
//                             FractionallySizedBox(
//                               alignment: Alignment.centerLeft,
//                               widthFactor: skill.percent / 100,
//                               child: Container(
//                                 decoration: BoxDecoration(
//                                   gradient: LinearGradient(
//                                     colors: [
//                                       skill.accent,
//                                       skill.accent.withOpacity(0.85),
//                                     ],
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),

//         // percentage pill top-right
//         Positioned(
//           right: 10,
//           top: -6,
//           child: Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
//             decoration: BoxDecoration(
//               color: skill.accent,
//               borderRadius: BorderRadius.circular(24),
//               boxShadow: [
//                 BoxShadow(
//                   color: skill.accent.withOpacity(0.35),
//                   blurRadius: 12,
//                   spreadRadius: 0,
//                 ),
//               ],
//             ),
//             child: Text(
//               '${skill.percent}%',
//               style: const TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//         ),
//       ],
//     );
//   }
// }
