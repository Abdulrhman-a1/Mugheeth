import 'package:flutter/material.dart';

///We will use this to show ai text
class AnimatedText extends StatefulWidget {
  final String text;
  final Duration speed;

  const AnimatedText(
      {super.key,
      required this.text,
      this.speed = const Duration(milliseconds: 50)});

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<int> _textAnimation;
  int _displayedCharacterCount = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: widget.speed * widget.text.length);
    _textAnimation =
        IntTween(begin: 0, end: widget.text.length).animate(_controller);
    _controller.addListener(_updateDisplayedText);
    _controller.forward();
  }

  void _updateDisplayedText() {
    setState(() {
      _displayedCharacterCount = _textAnimation.value;
    });
  }

  @override
  void didUpdateWidget(covariant AnimatedText oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.text != widget.text) {
      _controller.dispose();
      _controller = AnimationController(
          vsync: this, duration: widget.speed * widget.text.length);
      _textAnimation =
          IntTween(begin: 0, end: widget.text.length).animate(_controller);
      _controller.addListener(_updateDisplayedText);
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text(widget.text.substring(0, _displayedCharacterCount));
  }
}
