import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/text_style.dart';
import 'package:graduation/features/recording/logic/speech_to_text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RecordButton extends StatelessWidget {
  const RecordButton({
    super.key,
    required this.speechController,
    required this.onClose,
  });

  final SpeechController speechController;
  final VoidCallback onClose;

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

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
                icon: const Icon(Icons.close, color: Colors.white),
                onPressed: onClose,
              ),
            ),
            SizedBox(width: 30.w),
            Hero(
              tag: "microphoneHero",
              child:
                  Text(loc.recording_button_text, style: TextStyles.recording),
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
