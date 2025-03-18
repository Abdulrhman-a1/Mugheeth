import 'package:flutter/material.dart';

class ChatSection extends StatefulWidget {
  final PageController controller;

  const ChatSection({super.key, required this.controller});

  @override
  _ChatSectionState createState() => _ChatSectionState();
}

class _ChatSectionState extends State<ChatSection> {
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
    return Container(
      child: Column(
        children: [
          Stack(
            children: [
              Positioned(
                top: -380 + (_offset * 250),
                right: -240 + (_offset * 250),
                child: Transform.translate(
                  offset: Offset(50, 100),
                  child: Image.asset(
                    'assets/images/left.png',
                    height: 110,
                  ),
                ),
              ),
              Transform.translate(
                offset: Offset(0, 0),
                child: SizedBox(
                  height: 400 + (_offset * 250),
                  child: Image.asset(
                    'assets/images/mock.png',
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
