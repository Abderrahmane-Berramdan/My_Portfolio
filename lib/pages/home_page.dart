import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:my_portfolio/pages/projects_page.dart';
import 'package:my_portfolio/pages/skills_page.dart';
import 'package:my_portfolio/widgets/consts.dart';
import 'package:my_portfolio/widgets/hover_icon.dart';
import 'package:my_portfolio/widgets/experience_section.dart';
import 'package:my_portfolio/widgets/education_section.dart';
import 'package:my_portfolio/widgets/contact_section.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isHovering = false;

  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _educationKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  Future<void> openCV() async {
    try {
      if (kIsWeb) {
        await launchUrlString(urlCV, webOnlyWindowName: '_blank');
      } else {
        final uri = Uri.parse(urlCV);
        final launched = await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
        if (!mounted) return;
        if (!launched) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text("Unable to open file")));
        }
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("An error occurred:$e")));
    }
  }

  Future<void> openGithub() async {
    try {
      if (kIsWeb) {
        await launchUrlString(urlGtihub, webOnlyWindowName: "_blank");
      } else {
        final uri = Uri.parse(urlGtihub);
        final launched = await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
        if (!mounted) return;
        if (!launched) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Unable to open The link")),
          );
        }
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("An error occurred: $e")));
    }
  }

  Future<void> openLinkedin() async {
    try {
      if (kIsWeb) {
        await launchUrlString(urlLinkedin, webOnlyWindowName: "_blank");
      } else {
        final uri = Uri.parse(urlLinkedin);
        final launched = await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
        if (!mounted) return;
        if (!launched) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Unable to open The link")),
          );
        }
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("An error occurred: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff252734),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: false,
            snap: false,
            elevation: 0,
            scrolledUnderElevation: 0,
            shadowColor: Colors.transparent,
            surfaceTintColor: Colors.transparent,
            backgroundColor: const Color(0xff252734),
            automaticallyImplyLeading: false,
            toolbarHeight: 80,
            expandedHeight: 80,
            flexibleSpace: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 13,
                ),
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [Color(0xff333646), Color(0xff424657)],
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      "AB",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.w100,
                      ),
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        HoverIcon(
                          text: "About me",
                          scrollController: _scrollController,
                          targetKey: _aboutKey,
                        ),
                        HoverIcon(
                          text: "Skills",
                          scrollController: _scrollController,
                          targetKey: _skillsKey,
                        ),
                        HoverIcon(
                          text: "Projects",
                          scrollController: _scrollController,
                          targetKey: _projectsKey,
                        ),
                        HoverIcon(
                          text: "Experience",
                          scrollController: _scrollController,
                          targetKey: _experienceKey,
                        ),
                        HoverIcon(
                          text: "Education",
                          scrollController: _scrollController,
                          targetKey: _educationKey,
                        ),
                        HoverIcon(
                          text: "Contact",
                          scrollController: _scrollController,
                          targetKey: _contactKey,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Column(
                children: [
                  SizedBox(key: _aboutKey, height: 70),

                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   spacing: 70,
                  //   children: [
                  //     // your existing content here...
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 70,
                    children: [
                      Container(
                        height: 350,
                        width: 350,
                        margin: const EdgeInsets.only(left: 17),
                        decoration: BoxDecoration(
                          color: const Color(0xff424657),
                          borderRadius: BorderRadius.circular(200),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 30,
                              color: Colors.grey,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: const CircleAvatar(
                          backgroundImage: AssetImage("assets/my_photo.jpg"),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        spacing: 10,
                        children: [
                          const Text(
                            "Hello There",
                            style: TextStyle(
                              letterSpacing: 2,
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ShaderMask(
                            shaderCallback: (bounds) {
                              return const LinearGradient(
                                colors: [Color(0xff333646), Colors.white],
                              ).createShader(bounds);
                            },
                            child: const Text(
                              "I'am Abderrahmane Berramdan",
                              style: TextStyle(
                                letterSpacing: 5,
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Text(
                            "Building Mobile & Web Apps with Flutter",
                            style: TextStyle(
                              letterSpacing: 2,
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            width: 800,
                            child: Text(
                              "I am a passionate application developer focused on building practical and user-friendly solutions using Flutter. I enjoy turning ideas into clean, efficient applications that work smoothly across multiple platforms. I enjoy working as part of a team, collaborating, and sharing ideas to achieve better results. I am constantly learning, improving my skills, and exploring new technologies while aiming to deliver meaningful and well-designed digital experiences.",
                              softWrap: true,
                              style: TextStyle(
                                letterSpacing: 1,
                                color: Colors.white,
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 100,
                            width: 300,
                            child: Row(
                              spacing: 10,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Tooltip(
                                  message: "GitHub",
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black87,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: GestureDetector(
                                    onTap: openGithub,
                                    child: Lottie.asset(
                                      "assets/github.json",
                                      height: 70,
                                    ),
                                  ),
                                ),
                                Tooltip(
                                  message: "Linkedin",
                                  textStyle: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 13,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.black87,
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: GestureDetector(
                                    onTap: openLinkedin,
                                    child: Lottie.asset(
                                      "assets/linkedin.json",
                                      height: 60,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          MouseRegion(
                            onEnter: (_) => setState(() => _isHovering = true),
                            onExit: (_) => setState(() => _isHovering = false),

                            child: GestureDetector(
                              onTap: openCV,
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                transform: _isHovering
                                    ? (Matrix4.identity()
                                        ..translate(0, -5)
                                        ..scale(1.05))
                                    : Matrix4.identity(),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 13,
                                ),
                                decoration: BoxDecoration(
                                  color: const Color(0xff333646),
                                  borderRadius: BorderRadius.circular(30),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: _isHovering ? 20 : 10,
                                      color: Colors.grey,
                                      spreadRadius: _isHovering ? 3 : 1,
                                    ),
                                  ],
                                ),
                                child: const Text(
                                  "Show my CV",
                                  style: TextStyle(
                                    letterSpacing: 2,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 130),
                  Center(
                    key: _skillsKey,
                    child: Column(
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'My ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: 'Skills',
                                style: TextStyle(
                                  color: Color(0xff424657),
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                          child: Divider(
                            color: Color(0xff424657),
                            height: 50,
                            thickness: 6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SkillsPage(),
                  const SizedBox(height: 30),
                  Center(
                    key: _projectsKey,
                    child: Column(
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'My ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: 'Projects',
                                style: TextStyle(
                                  color: Color(0xff424657),
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                          child: Divider(
                            color: Color(0xff424657),
                            height: 50,
                            thickness: 6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 600, child: ProjectsPage()),
                  const SizedBox(height: 30),
                  Center(
                    key: _experienceKey,
                    child: Column(
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'My ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: 'Experience',
                                style: TextStyle(
                                  color: Color(0xff424657),
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                          child: Divider(
                            color: Color(0xff424657),
                            height: 50,
                            thickness: 6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const ExperienceSection(),
                  const SizedBox(height: 30),
                  Center(
                    key: _educationKey,
                    child: Column(
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'My ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: 'Education',
                                style: TextStyle(
                                  color: Color(0xff424657),
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                          child: Divider(
                            color: Color(0xff424657),
                            height: 50,
                            thickness: 6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const EducationSection(),
                  const SizedBox(height: 30),
                  Center(
                    key: _contactKey,
                    child: Column(
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Contact ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text: 'Me',
                                style: TextStyle(
                                  color: Color(0xff424657),
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 100,
                          child: Divider(
                            color: Color(0xff424657),
                            height: 50,
                            thickness: 6,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const ContactSection(),
                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     backgroundColor: const Color(0xff252734),
  //     // const Color(0xff333646)
  //     body: Padding(
  //       padding: const EdgeInsets.all(15),
  //       child: ListView(
  //         controller: _scrollController,
  //         // spacing: 30,
  //         // mainAxisAlignment: MainAxisAlignment.start,
  //         children: [
  //           Container(
  //             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
  //             decoration: BoxDecoration(
  //               gradient: const LinearGradient(
  //                 colors: [Color(0xff333646), Color(0xff424657)],
  //               ),
  //               borderRadius: BorderRadius.circular(30),
  //               color: const Color(0xff424657),
  //             ),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 const Text(
  //                   "AB",
  //                   style: TextStyle(
  //                     color: Colors.white,
  //                     fontSize: 22,
  //                     fontWeight: FontWeight.w100,
  //                   ),
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.spaceAround,
  //                   children: [
  //                     HoverIcon(
  //                       text: "About me",
  //                       scrollController: _scrollController,
  //                     ),
  //                     HoverIcon(
  //                       text: "Skills",
  //                       scrollController: _scrollController,
  //                     ),
  //                     HoverIcon(
  //                       text: "Projects",
  //                       scrollController: _scrollController,
  //                     ),
  //                     HoverIcon(
  //                       text: "Experience",
  //                       scrollController: _scrollController,
  //                     ),
  //                     HoverIcon(
  //                       text: "Education",
  //                       scrollController: _scrollController,
  //                     ),
  //                     HoverIcon(
  //                       text: "Contact",
  //                       scrollController: _scrollController,
  //                     ),
  //                   ],
  //                 ),
  //               ],
  //             ),
  //           ),
  //           const SizedBox(height: 70),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             spacing: 70,
  //             children: [
  //               Container(
  //                 height: 350,
  //                 width: 350,
  //                 margin: const EdgeInsets.only(left: 17),
  //                 decoration: BoxDecoration(
  //                   color: const Color(0xff424657),
  //                   borderRadius: BorderRadius.circular(200),
  //                   boxShadow: const [
  //                     BoxShadow(
  //                       blurRadius: 30,
  //                       color: Colors.grey,
  //                       spreadRadius: 5,
  //                     ),
  //                   ],
  //                 ),
  //                 child: const CircleAvatar(
  //                   backgroundImage: AssetImage("assets/my_photo.jpg"),
  //                 ),
  //               ),
  //               Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 spacing: 10,
  //                 children: [
  //                   const Text(
  //                     "Hello There",
  //                     style: TextStyle(
  //                       letterSpacing: 2,
  //                       color: Colors.white,
  //                       fontSize: 20,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                   ShaderMask(
  //                     shaderCallback: (bounds) {
  //                       return const LinearGradient(
  //                         colors: [Color(0xff333646), Colors.white],
  //                       ).createShader(bounds);
  //                     },
  //                     child: const Text(
  //                       "I'am Abderrahmane Berramdan",
  //                       style: TextStyle(
  //                         letterSpacing: 5,
  //                         color: Colors.white,
  //                         fontSize: 40,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                   ),
  //                   const Text(
  //                     "Building Mobile & Web Apps with Flutter",
  //                     style: TextStyle(
  //                       letterSpacing: 2,
  //                       color: Colors.white,
  //                       fontSize: 20,
  //                       fontWeight: FontWeight.bold,
  //                     ),
  //                   ),
  //                   const SizedBox(
  //                     width: 800,
  //                     child: Text(
  //                       "I am a passionate application developer focused on building practical and user-friendly solutions using Flutter. I enjoy turning ideas into clean, efficient applications that work smoothly across multiple platforms. I enjoy working as part of a team, collaborating, and sharing ideas to achieve better results. I am constantly learning, improving my skills, and exploring new technologies while aiming to deliver meaningful and well-designed digital experiences.",
  //                       softWrap: true,
  //                       style: TextStyle(letterSpacing: 1, color: Colors.white),
  //                     ),
  //                   ),

  //                   SizedBox(
  //                     height: 100,
  //                     width: 300,
  //                     child: Row(
  //                       spacing: 10,
  //                       mainAxisAlignment: MainAxisAlignment.start,
  //                       children: [
  //                         Tooltip(
  //                           message: "GitHub",
  //                           textStyle: const TextStyle(
  //                             color: Colors.white,
  //                             fontSize: 13,
  //                           ),
  //                           decoration: BoxDecoration(
  //                             color: Colors.black87,
  //                             borderRadius: BorderRadius.circular(6),
  //                           ),
  //                           child: GestureDetector(
  //                             onTap: openGithub,
  //                             child: Lottie.asset(
  //                               "assets/github.json",
  //                               height: 70,
  //                             ),
  //                           ),
  //                         ),
  //                         Tooltip(
  //                           message: "Linkedin",
  //                           textStyle: const TextStyle(
  //                             color: Colors.white,
  //                             fontSize: 13,
  //                           ),
  //                           decoration: BoxDecoration(
  //                             color: Colors.black87,
  //                             borderRadius: BorderRadius.circular(6),
  //                           ),
  //                           child: GestureDetector(
  //                             onTap: openLinkedin,
  //                             child: Lottie.asset(
  //                               "assets/linkedin.json",
  //                               height: 60,
  //                             ),
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                   MouseRegion(
  //                     onEnter: (_) => setState(() => _isHovering = true),
  //                     onExit: (_) => setState(() => _isHovering = false),

  //                     child: GestureDetector(
  //                       onTap: openCV,
  //                       child: AnimatedContainer(
  //                         duration: const Duration(milliseconds: 300),
  //                         transform: _isHovering
  //                             ? (Matrix4.identity()
  //                                 ..translate(0, -5)
  //                                 ..scale(1.05))
  //                             : Matrix4.identity(),
  //                         padding: const EdgeInsets.symmetric(
  //                           horizontal: 20,
  //                           vertical: 13,
  //                         ),
  //                         decoration: BoxDecoration(
  //                           color: const Color(0xff333646),
  //                           borderRadius: BorderRadius.circular(30),
  //                           boxShadow: [
  //                             BoxShadow(
  //                               blurRadius: _isHovering ? 20 : 10,
  //                               color: Colors.grey,
  //                               spreadRadius: _isHovering ? 3 : 1,
  //                             ),
  //                           ],
  //                         ),
  //                         child: const Text(
  //                           "Show my CV",
  //                           style: TextStyle(
  //                             letterSpacing: 2,
  //                             color: Colors.white,
  //                             fontWeight: FontWeight.bold,
  //                           ),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //           const SizedBox(height: 60),
  //           Center(
  //             child: Column(
  //               children: [
  //                 RichText(
  //                   text: const TextSpan(
  //                     children: [
  //                       TextSpan(
  //                         text: 'My ',
  //                         style: TextStyle(
  //                           color: Colors.white,
  //                           fontSize: 32,
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                       ),
  //                       TextSpan(
  //                         text: 'Skills',
  //                         style: TextStyle(
  //                           color: Color(0xff424657),
  //                           fontSize: 32,
  //                           fontWeight: FontWeight.bold,
  //                           fontStyle: FontStyle.italic,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   width: 100,
  //                   child: Divider(
  //                     color: Color(0xff424657),
  //                     height: 50,
  //                     thickness: 6,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),

  //           // const SizedBox(height: 30),
  //           SkillsPage(),
  //           // /////////////////////////////////////////////////
  //           const SizedBox(height: 30),
  //           Center(
  //             child: Column(
  //               children: [
  //                 RichText(
  //                   text: const TextSpan(
  //                     children: [
  //                       TextSpan(
  //                         text: 'My ',
  //                         style: TextStyle(
  //                           color: Colors.white,
  //                           fontSize: 32,
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                       ),
  //                       TextSpan(
  //                         text: 'Projects',
  //                         style: TextStyle(
  //                           color: Color(0xff424657),
  //                           fontSize: 32,
  //                           fontWeight: FontWeight.bold,
  //                           fontStyle: FontStyle.italic,
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ),
  //                 const SizedBox(
  //                   width: 100,
  //                   child: Divider(
  //                     color: Color(0xff424657),
  //                     height: 50,
  //                     thickness: 6,
  //                   ),
  //                 ),
  //               ],
  //             ),
  //           ),
  //           // const SizedBox(height: 30),
  //           const SizedBox(height: 600, child: ProjectsPage()),
  //           ///////////////////////////////////////////////
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
