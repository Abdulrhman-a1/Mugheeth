import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Welcoming extends StatefulWidget {
  final PageController controller;

  const Welcoming({
    super.key,
    required this.controller,
  });

  @override
  WelcomingState createState() => WelcomingState();
}

class WelcomingState extends State<Welcoming> {
  double _offset = 0.0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_pageListener);
  }

  void _pageListener() {
    if (mounted) {
      setState(() {
        _offset = widget.controller.page ?? 0;
      });
    }
  }

  @override
  void dispose() {
    widget.controller.removeListener(_pageListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Transform.translate(
          offset: Offset(0, -_offset * 200),
          child: Lottie.asset(
            'assets/lottie/iii.json',
          ),
        ),
      ],
    );
  }
}
