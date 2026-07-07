import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// A reusable wrapper widget that triggers animate_do animations 
/// only when the widget scrolls into the viewport. 
/// It tracks its visibility state and triggers the animation exactly once.
class ScrollReveal extends StatefulWidget {
  final Widget child;
  final Widget Function(Widget child)? animationBuilder;
  final Duration delay;
  final Duration duration;
  final double threshold;

  const ScrollReveal({
    super.key,
    required this.child,
    this.animationBuilder,
    this.delay = Duration.zero,
    this.duration = const Duration(milliseconds: 600),
    this.threshold = 0.15,
  });

  @override
  State<ScrollReveal> createState() => _ScrollRevealState();
}

class _ScrollRevealState extends State<ScrollReveal> {
  bool _hasBeenVisible = false;
  late final Key _detectorKey;

  @override
  void initState() {
    super.initState();
    // Unique but stable key for the lifetime of this state
    _detectorKey = UniqueKey();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: _detectorKey,
      onVisibilityChanged: (visibilityInfo) {
        if (!_hasBeenVisible && visibilityInfo.visibleFraction > widget.threshold) {
          if (mounted) {
            setState(() {
              _hasBeenVisible = true;
            });
          }
        }
      },
      child: _hasBeenVisible
          ? (widget.animationBuilder != null
              ? widget.animationBuilder!(widget.child)
              : FadeInUp(
                  duration: widget.duration,
                  delay: widget.delay,
                  child: widget.child,
                ))
          : Opacity(
              opacity: 0,
              child: widget.child,
            ),
    );
  }
}
