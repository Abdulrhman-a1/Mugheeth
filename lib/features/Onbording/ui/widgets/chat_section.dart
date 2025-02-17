import 'package:flutter/material.dart';

/// Second onBoarding page.
class ChatSection extends StatefulWidget {
  final PageController controller;

  const ChatSection({super.key, required this.controller});

  @override
  State<ChatSection> createState() => _ChatSectionState();
}

class _ChatSectionState extends State<ChatSection> {
  //double _offset = 0.0;

  @override
  void initState() {
    super.initState();
    widget.controller.addListener(_pageListener);
  }

  void _pageListener() {
    if (mounted) {
      setState(() {
        //_offset = widget.controller.page ?? 0;
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
    return const Center(
      child: Text("{}"),
    );
  }
}
