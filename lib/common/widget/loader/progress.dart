import 'package:flutter/material.dart';

class BouncingLogoLoader extends StatefulWidget {
  final double size;

  const BouncingLogoLoader({
    super.key,
    this.size = 80.0,
  });

  @override
  State<BouncingLogoLoader> createState() => _BouncingLogoLoaderState();
}

class _BouncingLogoLoaderState extends State<BouncingLogoLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scale;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _scale = Tween<double>(begin: 0.9, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );
    _controller.repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ScaleTransition(
        scale: _scale,
        child: SizedBox(
          width: widget.size,
          height: widget.size,
          child: Image.asset(
            'assets/images/logo.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }
}
