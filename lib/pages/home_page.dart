import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isHovering = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff252734),
      // const Color(0xff333646)
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: ListView(
          // spacing: 30,
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xff252734), Color(0xff424657)],
                ),
                borderRadius: BorderRadius.circular(30),
                color: const Color(0xff424657),
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
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Home",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Skills",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Projects",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Experience",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "Contact",
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 70),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 70,
              children: [
                const SizedBox(
                  height: 260,
                  width: 260,
                  child: CircleAvatar(
                    radius: 25,
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
                          colors: [Color(0xff424657), Colors.white],
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
                        style: TextStyle(letterSpacing: 1, color: Colors.white),
                      ),
                    ),

                    SizedBox(
                      height: 100,
                      width: 300,
                      child: Row(
                        spacing: 10,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Lottie.asset("assets/github.json", height: 70),
                          Lottie.asset(
                            "assets/Linkedin Subtle.json",
                            height: 60,
                          ),
                        ],
                      ),
                    ),
                    // Container(
                    //   padding: const EdgeInsets.symmetric(
                    //     horizontal: 20,
                    //     vertical: 13,
                    //   ),
                    //   decoration: BoxDecoration(
                    //     boxShadow: const [
                    //       BoxShadow(
                    //         blurRadius: 10,
                    //         color: Colors.grey,
                    //         spreadRadius: 1,
                    //       ),
                    //     ],
                    //     borderRadius: BorderRadius.circular(30),
                    //     color: const Color(0xff424657),
                    //   ),
                    //   child: const Text(
                    //     "Download CV",
                    //     style: TextStyle(
                    //       letterSpacing: 2,
                    //       color: Colors.white,
                    //       fontWeight: FontWeight.bold,
                    //     ),
                    //   ),
                    // ),
                    MouseRegion(
                      onEnter: (_) => setState(() => _isHovering = true),
                      onExit: (_) => setState(() => _isHovering = false),
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
                          color: const Color(0xff424657),
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
                          "Download CV",
                          style: TextStyle(
                            letterSpacing: 2,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
