import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/widget/pop_up/record_popUp.dart';

class MicAndCamera extends StatelessWidget {
  const MicAndCamera({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18.sp,
            backgroundColor: Colors.grey[300],
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Image.asset(
                'assets/icons/microphone.png',
                width: 18.sp,
                height: 18.sp,
                color: Colors.black,
              ),
              onPressed: () {},
            ),
          ),
          const SizedBox(width: 12),
          CircleAvatar(
            radius: 18.sp,
            backgroundColor: Colors.grey[300],
            child: IconButton(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
              icon: Hero(
                tag: 'microphoneHero',
                child: Image.asset(
                  'assets/icons/microphone.png',
                  width: 18.sp,
                  height: 18.sp,
                  color: Colors.black,
                ),
              ),
              onPressed: () {
                showRecordingScreen(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
