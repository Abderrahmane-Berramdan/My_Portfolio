import 'package:flutter/material.dart';

class HoverIcon extends StatefulWidget {
  final String text;
  final ScrollController scrollController;
  final GlobalKey? targetKey;
  const HoverIcon({
    super.key,
    required this.text,
    required this.scrollController,
    this.targetKey,
  });

  @override
  State<HoverIcon> createState() => _HoverIconState();
}

class _HoverIconState extends State<HoverIcon> {
  bool isHovering2 = false;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: const ButtonStyle(
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
      ),
      onPressed: () {
        final context = widget.targetKey?.currentContext;
        if (context != null) {
          Scrollable.ensureVisible(
            context,
            alignment: 0.0,
            duration: const Duration(milliseconds: 800),
            curve: Curves.easeOut,
          );
        } else {
          widget.scrollController.animateTo(
            widget.text == "About me"
                ? 0 
                : widget.text == "Skills"
                ? 530
                : widget.text == "Projects"
                ? 1590
                : widget.text == "Experience"
                ? 1900  
                : widget.text == "Education"
                ? 800
                : widget.text == "Contact"
                ? 1640
                : 0,
            duration: const Duration(milliseconds:800),
            curve: Curves.easeOut,
          );
        }
      },
      onHover: (value) {
        setState(() {
          isHovering2 = value;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        transform: isHovering2
            ? (Matrix4.identity()..translate(0, -4))
            : Matrix4.identity(),
        child: Text(
          widget.text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
