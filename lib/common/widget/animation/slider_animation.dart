import 'package:flutter/material.dart';

///Up slider animation for the widgets. we can use it whenever we need; just wrap ur ui.
class AnimatedItem extends StatefulWidget {
  final int index;
  final Widget child;
  final bool? fromLeft;

  const AnimatedItem({
    super.key,
    required this.index,
    required this.child,
    this.fromLeft,
  });

  @override
  State<AnimatedItem> createState() => _AnimatedItemState();
}

class _AnimatedItemState extends State<AnimatedItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    Offset beginOffset;
    if (widget.fromLeft == true) {
      beginOffset = const Offset(-1.5, 0);
    } else {
      beginOffset = const Offset(0, 1.5);
    }

    _slideAnimation = Tween<Offset>(
      begin: beginOffset,
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.1 * widget.index,
          0.1 * widget.index + 0.5,
          curve: Curves.easeOut,
        ),
      ),
    );

    _fadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(
          0.01 * widget.index,
          0.1 * widget.index + 0.5,
          curve: Curves.easeOut,
        ),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, _) {
        return SlideTransition(
          position: _slideAnimation,
          child: FadeTransition(
            opacity: _fadeAnimation,
            child: widget.child,
          ),
        );
      },
    );
  }
}
