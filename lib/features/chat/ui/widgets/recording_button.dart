import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/text_style.dart';
import 'package:graduation/features/recording/logic/speech_to_text.dart';

///Button inside recording screen.
class RecordButton extends StatelessWidget {
  const RecordButton({
    super.key,
    required this.speechController,
  });

  final SpeechController speechController;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: speechController.toggleListening,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28.sp,
              backgroundColor: Colors.white.withOpacity(0.1),
              child: IconButton(
                icon: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            SizedBox(width: 30.w),
            Hero(
              tag: "microphoneHero",
              child: Text(
                'مغيث يسمع...',
                style: TextStyles.recording,
              ),
            ),
            SizedBox(width: 30.w),
            CircleAvatar(
              radius: 28.sp,
              backgroundColor: Colors.white.withOpacity(0.1),
              child: IconButton(
                icon: Icon(
                  speechController.isListening ? Icons.stop : Icons.mic,
                  color: Colors.white,
                ),
                onPressed: speechController.toggleListening,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
