import 'package:flutter/material.dart';

class HoverIcon extends StatefulWidget {
  final String text;
  const HoverIcon({super.key, required this.text});

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
      onPressed: () {},
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
