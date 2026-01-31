import 'package:flutter/material.dart';

class BackdropFilterLayer extends StatelessWidget {
  final double opacity;
  const BackdropFilterLayer({super.key, this.opacity = 0.1});

  @override
  Widget build(BuildContext context) {
    // Simple semi-transparent circle to emulate blur/glow
    return Container(
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Colors.white.withOpacity(opacity),
        borderRadius: BorderRadius.circular(200),
      ),
    );
  }
}