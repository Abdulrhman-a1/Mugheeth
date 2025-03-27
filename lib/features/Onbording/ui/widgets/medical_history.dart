import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MedicalHistory extends StatefulWidget {
  const MedicalHistory({super.key, required this.controller});
  final PageController controller;

  @override
  State<MedicalHistory> createState() => _MedicalHistoryState();
}

class _MedicalHistoryState extends State<MedicalHistory> {
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
          Expanded(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  top: 820 - (_offset * 250),
                  left: -220 + (_offset * 100),
                  child: Transform.translate(
                    offset: Offset(1, 1),
                    child: Image.asset(
                      'assets/images/waves.png',
                      height: 60,
                    ),
                  ),
                ),
                Transform.translate(
                  offset: Offset(0, 0),
                  child: SizedBox(
                    height: (_offset * 200),
                    child: Image.asset(
                      'assets/images/historyMock.png',
                    ),
                  ),
                ),
                Positioned(
                  top: 760 - (_offset * 250),
                  child: Center(
                    child: Image.asset(
                      'assets/images/historyrecord.png',
                      height: 100.h,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
