import 'package:flutter/material.dart';

class Welcoming extends StatefulWidget {
  final PageController controller;

  const Welcoming({super.key, required this.controller});

  @override
  // ignore: library_private_types_in_public_api
  _WelcomingState createState() => _WelcomingState();
}

class _WelcomingState extends State<Welcoming> {
  // double _offset = 0.0;

  @override
  void initState() {
    super.initState();

    widget.controller.addListener(_pageListener);
  }

  void _pageListener() {
    if (mounted) {
      setState(() {
        // _offset = widget.controller.page ?? 0;
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Transform.translate(
        //   offset: const Offset(8, 35),
        //   child: SizedBox(
        //     height: 350 + (_offset * 250),
        //     child: Image.asset(
        //       'assets/images/medical.png',
        //       width: double.infinity,
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
