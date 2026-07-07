import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

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
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("An error occurred: $e")),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1000),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              LayoutBuilder(
                builder: (context, constraints) {
                  final double width = constraints.maxWidth;
                  int crossAxisCount = 4;
                  double childAspectRatio = 1.1;

                  if (width < 600) {
                    crossAxisCount = 1;
                    childAspectRatio = 2.8;
                  } else if (width < 900) {
                    crossAxisCount = 2;
                    childAspectRatio = 1.4;
                  }

                  return GridView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: childAspectRatio,
                    ),
                    children: [
                      ContactInfoCard(
                        icon: Icons.email_rounded,
                        title: "Email",
                        value: "berramdan.abderrahmane30\n@gmail.com",
                        onTap: () => _launchUrl(
                          context,
                          "mailto:berramdan.abderrahmane30@gmail.com",
                        ),
                      ),
                      ContactInfoCard(
                        icon: Icons.phone_rounded,
                        title: "Phone",
                        value: "+213 696750847",
                        onTap: () => _launchUrl(
                          context,
                          "tel:+213696750847",
                        ),
                      ),
                      ContactInfoCard(
                        icon: Icons.location_on_rounded,
                        title: "Location",
                        value: "Algiers, Algeria",
                        onTap: () {},
                      ),
                      ContactInfoCard(
                        icon: Icons.check_circle_rounded,
                        title: "Available for",
                        value: "Opportunities",
                        onTap: () {},
                      ),
                    ],
                  );
                },
              ),
              const SizedBox(height: 40),
              // Connect divider
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade800,
                      thickness: 1,
                      endIndent: 20,
                    ),
                  ),
                  const Text(
                    "Connect with me",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.2,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      color: Colors.grey.shade800,
                      thickness: 1,
                      indent: 20,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 20,
                children: [
                  SocialButton(
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
                  SocialButton(
                    customIcon: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 1),
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ContactInfoCard extends StatefulWidget {
  final IconData icon;
  final String title;
  final String value;
  final VoidCallback onTap;

  const ContactInfoCard({
    super.key,
    required this.icon,
    required this.title,
    required this.value,
    required this.onTap,
  });

  @override
  State<ContactInfoCard> createState() => _ContactInfoCardState();
}

class _ContactInfoCardState extends State<ContactInfoCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Colors.blue;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedScale(
          scale: _isHovered ? 1.05 : 1.0,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
          child: Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color(0xff333646).withValues(alpha: 0.5),
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: _isHovered ? primaryColor.withValues(alpha: 0.5) : Colors.grey.shade800,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withValues(alpha: 0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: primaryColor.withValues(alpha: 0.35),
                        blurRadius: 10,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: Icon(
                    widget.icon,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  widget.title,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 6),
                Text(
                  widget.value,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SocialButton extends StatefulWidget {
  final Widget customIcon;
  final String label;
  final Color backgroundColor;
  final Color hoverColor;
  final VoidCallback onTap;

  const SocialButton({
    super.key,
    required this.customIcon,
    required this.label,
    required this.backgroundColor,
    required this.hoverColor,
    required this.onTap,
  });

  @override
  State<SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<SocialButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            color: _isHovered ? widget.hoverColor : widget.backgroundColor,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey.shade800),
            boxShadow: [
              BoxShadow(
                blurRadius: _isHovered ? 15 : 5,
                color: _isHovered ? widget.hoverColor.withValues(alpha: 0.4) : Colors.black26,
                spreadRadius: _isHovered ? 2 : 1,
              ),
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              widget.customIcon,
              const SizedBox(width: 10),
              Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
