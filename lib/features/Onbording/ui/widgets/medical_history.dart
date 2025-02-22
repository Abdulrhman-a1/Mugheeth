import 'package:flutter/material.dart';

class MedicalHistory extends StatefulWidget {
  final PageController controller;

  const MedicalHistory({super.key, required this.controller});

  @override
  _MedicalHistoryState createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
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
    return Container(
      child: Column(
        children: [],
      ),
    );
  }
}
