import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isHovering = false;
  bool _isHovering2 = false;

  final String urlGtihub = "https://github.com/Abderrahmane-Berramdan";
  final String urlLinkedin =
      "https://www.linkedin.com/in/abderrahmane-berramdan-6bb225301/";
  final String urlCV =
      "https://drive.google.com/file/d/19q6fRdS1WwVftLAm4QvMw8wyY3KSGOqU/view?usp=sharing";

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
                        style: const ButtonStyle(
                          overlayColor: WidgetStatePropertyAll(
                            Colors.transparent,
                          ),
                        ),
                        onPressed: () {},
                        onHover: (value) {
                          setState(() {
                            _isHovering2 = value;
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 250),
                          transform: _isHovering2
                              ? (Matrix4.identity()..translate(0, -4))
                              : Matrix4.identity(),
                          child: const Text(
                            "Home",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
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
                Container(
                  height: 350,
                  width: 350,
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
