import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/widget/animation/bounc_circle.dart';
import 'package:graduation/features/chat/ui/widgets/recording_button.dart';
import 'package:graduation/features/recording/logic/speech_to_text.dart';
import 'package:graduation/features/recording/ui/widgets/recording_text.dart';
import 'package:provider/provider.dart';

///Builds the recording screen where user can start talking and we will do speech to text.
class RecordingScreen extends StatefulWidget {
  const RecordingScreen({super.key});

  @override
  State<RecordingScreen> createState() => _RecordingScreenState();
}

class _RecordingScreenState extends State<RecordingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
    Provider.of<SpeechController>(context, listen: false).initializeSpeech();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final speechController = Provider.of<SpeechController>(context);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 18, sigmaY: 18),
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.mainSoftBlue.withOpacity(0.4),
                  AppColors.mainAppColor.withOpacity(0.3),
                ],
              ),
            ),
            child: Column(
              children: [
                RecordingText(),
                const Spacer(),
                if (speechController.isListening)
                  BouncingCircle(controller: _controller),
                if (speechController.recognizedText.isNotEmpty)
                  SizedBox(height: 20.h),
                RecordButton(speechController: speechController),
                SizedBox(height: 100.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
