import 'package:animate_do/animate_do.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/widgets/contact_section.dart';
import 'package:my_portfolio/widgets/scroll_reveal.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PortfolioFooter extends StatelessWidget {
  const PortfolioFooter({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isMobile = MediaQuery.sizeOf(context).width < 700;
    final double fontSize = isMobile ? 12 : 13;

    Future<void> _launchUrl(BuildContext context, String urlString) async {
    try {
      final Uri uri = Uri.parse(urlString);
      if (kIsWeb) {
        await launchUrlString(urlString, webOnlyWindowName: '_blank');
      } else {
        final launched = await launchUrl(
          uri,
          mode: LaunchMode.externalApplication,
        );
        if (!launched) {
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Unable to open link")),
            );
          }
        }
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("An error occurred: $e")));
      }
    }
  }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: isMobile ? 28 : 36,
      ),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: Color(0xff333646), width: 1),
        ),
      ),
      child: Column(
        spacing: 40,
        children: [
          Wrap(
                alignment: WrapAlignment.center,
                spacing: 20,
                runSpacing: 14,
                children: [
                  ScrollReveal(
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 400),
                    animationBuilder: (child) => BounceInUp(
                      duration: const Duration(milliseconds: 600),
                      delay: const Duration(milliseconds: 400),
                      child: child,
                    ),
                    child: SocialButton(
                      customIcon: Image.asset(
                        "assets/github-sign.png",
                        height: 20,
                        color: Colors.white,
                      ),
                      label: "GitHub",
                      backgroundColor: const Color(0xff181A20),
                      hoverColor: const Color(0xff2A2D37),
                      onTap: () => _launchUrl(
                        context,
                        "https://github.com/Abderrahmane-Berramdan",
                      ),
                    ),
                  ),
                  ScrollReveal(
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 500),
                    animationBuilder: (child) => BounceInUp(
                      duration: const Duration(milliseconds: 600),
                      delay: const Duration(milliseconds: 500),
                      child: child,
                    ),
                    child: SocialButton(
                      customIcon: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 1,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: const Text(
                          "in",
                          style: TextStyle(
                            color: Color(0xff0A66C2),
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            height: 1.1,
                          ),
                        ),
                      ),
                      label: "LinkedIn",
                      backgroundColor: const Color(0xff0A66C2),
                      hoverColor: const Color(0xff1B7BDD),
                      onTap: () => _launchUrl(
                        context,
                        "https://www.linkedin.com/in/abderrahmane-berramdan-6bb225301/",
                      ),
                    ),
                  ),
                  ScrollReveal(
                    duration: const Duration(milliseconds: 600),
                    delay: const Duration(milliseconds: 600),
                    animationBuilder: (child) => BounceInUp(
                      duration: const Duration(milliseconds: 600),
                      delay: const Duration(milliseconds: 600),
                      child: child,
                    ),
                    child: SocialButton(
                      customIcon: const SizedBox(
                        width: 22,
                        height: 22,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            Icon(
                              Icons.chat_bubble_rounded,
                              color: Colors.white,
                              size: 20,
                            ),
                            Positioned(
                              top: 3.5,
                              left: 4.5,
                              child: Icon(
                                Icons.phone,
                                color: Color(0xff25D366),
                                size: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      label: "WhatsApp",
                      backgroundColor: const Color(0xff25D366),
                      hoverColor: const Color(0xff20BA5A),
                      onTap: () =>
                          _launchUrl(context, "https://wa.me/213696750847"),
                    ),
                  ),
                ],
              ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment. center,
            children: [
              Expanded(
                child: Text(
                  '© 2026 Abderrahmane Berramdan. All rights reserved. Made with by ME using Flutter & Modern Design',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.65),
                    fontSize: fontSize,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              // const SizedBox(height: 8),
              // Expanded(
              //   child: Text(
              //     'Made with by ME using Flutter & Modern Design',
              //     textAlign: TextAlign.center,
              //     style: TextStyle(
              //       color: Colors.white.withValues(alpha: 0.65),
              //       fontSize: fontSize,
              //       letterSpacing: 0.8,
              //     ),
              //   ),
              // ),
            ],
          ),
        ],
      ),
    );
  }
}
