import 'package:flutter/material.dart';

class AvailableForWorkBadge extends StatelessWidget {
  const AvailableForWorkBadge({super.key, this.compact = false});

  final bool compact;
  @override
  Widget build(BuildContext context) {
    final double fontSize = compact ? 12 : 16;
    final double dotSize = compact ? 6 : 7;
    final EdgeInsets padding = compact
        ? const EdgeInsets.symmetric(horizontal: 8, vertical: 4)
        : const EdgeInsets.symmetric(horizontal: 10, vertical: 5);

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        // color: Colors.grey.withValues(alpha: 0.5),
        color: const Color(0xff424657).withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: Colors.grey,
          width: 1,
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Container(
          //   width: dotSize,
          //   height: dotSize,
          //   decoration: BoxDecoration(
          //     color: _green,
          //     shape: BoxShape.circle,
          //     boxShadow: [
          //       BoxShadow(
          //         color: _green.withValues(alpha: 0.55),
          //         blurRadius: 4,
          //         spreadRadius: 0.5,
          //       ),
          //     ],
          //   ),
          // ),
          // SizedBox(width: compact ? 5 : 6),
          Text(
            'Available for work',
            style: TextStyle(
              color: Colors.white,
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
