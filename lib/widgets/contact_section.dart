import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:animate_do/animate_do.dart';
import 'package:my_portfolio/widgets/scroll_reveal.dart';
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
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text("An error occurred: $e")));
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
                  double childAspectRatio = 0.85;

                  if (width < 600) {
                    crossAxisCount = 1;
                    childAspectRatio = 1.4;
                  } else if (width < 900) {
                    crossAxisCount = 2;
                    childAspectRatio = 1.15;
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
                      ScrollReveal(
                        duration: const Duration(milliseconds: 500),
                        animationBuilder: (child) => ZoomIn(
                          duration: const Duration(milliseconds: 500),
                          child: child,
                        ),
                        child: EmailContactCard(
                          onTap: () => _launchUrl(
                            context,
                            "mailto:berramdan.abderrahmane30@gmail.com",
                          ),
                        ),
                      ),
                      ScrollReveal(
                        duration: const Duration(milliseconds: 500),
                        delay: const Duration(milliseconds: 100),
                        animationBuilder: (child) => ZoomIn(
                          duration: const Duration(milliseconds: 500),
                          delay: const Duration(milliseconds: 100),
                          child: child,
                        ),
                        child: ContactInfoCard(
                          icon: Icons.phone_rounded,
                          title: "Phone",
                          value: "+213 696750847",
                          onTap: () => _launchUrl(context, "tel:+213696750847"),
                        ),
                      ),
                      ScrollReveal(
                        duration: const Duration(milliseconds: 500),
                        delay: const Duration(milliseconds: 200),
                        animationBuilder: (child) => ZoomIn(
                          duration: const Duration(milliseconds: 500),
                          delay: const Duration(milliseconds: 200),
                          child: child,
                        ),
                        child: ContactInfoCard(
                          icon: Icons.location_on_rounded,
                          title: "Location",
                          value: "Algiers, Algeria",
                          onTap: () {},
                        ),
                      ),
                      ScrollReveal(
                        duration: const Duration(milliseconds: 500),
                        delay: const Duration(milliseconds: 300),
                        animationBuilder: (child) => ZoomIn(
                          duration: const Duration(milliseconds: 500),
                          delay: const Duration(milliseconds: 300),
                          child: child,
                        ),
                        child: ContactInfoCard(
                          icon: Icons.check_circle_rounded,
                          title: "Available for",
                          value: "Opportunities",
                          onTap: () {},
                        ),
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
            ],
          ),
        ),
      ),
    );
  }
}

class EmailContactCard extends StatefulWidget {
  final VoidCallback onTap;

  const EmailContactCard({super.key, required this.onTap});

  static const String email = 'berramdan.abderrahmane30@gmail.com';

  @override
  State<EmailContactCard> createState() => _EmailContactCardState();
}

class _EmailContactCardState extends State<EmailContactCard> {
  bool _isHovered = false;

  static const Color _primaryColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.03 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xff333646).withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: _isHovered
                  ? _primaryColor.withValues(alpha: 0.45)
                  : Colors.white.withValues(alpha: 0.06),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.35),
                blurRadius: 16,
                offset: const Offset(0, 8),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(20),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 22),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: widget.onTap,
                    behavior: HitTestBehavior.opaque,
                    child: Column(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: BoxDecoration(
                            color: _primaryColor,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: _primaryColor.withValues(alpha: 0.45),
                                blurRadius: 18,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: const Icon(
                            Icons.email_rounded,
                            color: Colors.white,
                            size: 26,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          EmailContactCard.email,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.75),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  const _CopyEmailPillButton(copyText: EmailContactCard.email),
                ],
              ),
            ),
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
      child: AnimatedScale(
        scale: _isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOut,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xff333646).withValues(alpha: 0.5),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _isHovered
                  ? primaryColor.withValues(alpha: 0.5)
                  : Colors.grey.shade800,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
                blurRadius: 10,
                offset: const Offset(0, 6),
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: widget.onTap,
                    behavior: HitTestBehavior.opaque,
                    child: SizedBox(
                      width: double.infinity,
                      child: Column(
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
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  GestureDetector(
                    onTap: widget.onTap,
                    behavior: HitTestBehavior.opaque,
                    child: Text(
                      widget.value,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Future<void> _showCopiedSnackBar(BuildContext context, String label) async {
  if (!context.mounted) return;

  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Row(
        children: [
          const Icon(
            Icons.check_circle_rounded,
            color: Colors.greenAccent,
            size: 20,
          ),
          const SizedBox(width: 8),
          Text(
            '$label copied!',
            style: const TextStyle(color: Colors.white, fontSize: 14),
          ),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color(0xff333646),
      duration: const Duration(seconds: 2),
      width: 250,
    ),
  );
}

class _CopyEmailPillButton extends StatefulWidget {
  final String copyText;

  const _CopyEmailPillButton({required this.copyText});

  @override
  State<_CopyEmailPillButton> createState() => _CopyEmailPillButtonState();
}

class _CopyEmailPillButtonState extends State<_CopyEmailPillButton> {
  bool _isHovered = false;

  Future<void> _copyToClipboard() async {
    await Clipboard.setData(ClipboardData(text: widget.copyText));
    if (!mounted) return;
    await _showCopiedSnackBar(context, 'Email');
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: Material(
        color: _isHovered
            ? Colors.white.withValues(alpha: 0.14)
            : Colors.white.withValues(alpha: 0.08),
        borderRadius: BorderRadius.circular(30),
        child: InkWell(
          onTap: _copyToClipboard,
          borderRadius: BorderRadius.circular(30),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.copy_rounded,
                  color: Colors.white.withValues(alpha: 0.85),
                  size: 16,
                ),
                const SizedBox(width: 10),
                Text(
                  'Copy Email',
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: 0.85),
                    fontSize: 13,
                    fontWeight: FontWeight.w500,
                  ),
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
                color: _isHovered
                    ? widget.hoverColor.withValues(alpha: 0.4)
                    : Colors.black26,
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
