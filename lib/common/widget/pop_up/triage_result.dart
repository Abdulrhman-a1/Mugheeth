import 'package:flutter/material.dart';
import 'package:graduation/common/theme/text.dart';
import 'package:graduation/common/widget/custom_shape/triage_body.dart';

class TriageResultModal extends StatelessWidget {
  final Map<String, String> triageResult;
  final VoidCallback onDismiss;
  final VoidCallback onNewSession;

  const TriageResultModal({
    super.key,
    required this.triageResult,
    required this.onDismiss,
    required this.onNewSession,
  });

  static void show(BuildContext context, Map<String, String> triageResult,
      VoidCallback onDismiss, VoidCallback onNewSession) {
    showGeneralDialog(
      context: context,
      barrierDismissible: false,
      barrierLabel: "Triage Result",
      transitionDuration: const Duration(milliseconds: 400),
      pageBuilder: (_, __, ___) => Container(),
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: Curves.easeInOut,
        );

        return ScaleTransition(
          scale: Tween<double>(begin: 0.5, end: 1.0).animate(curvedAnimation),
          child: FadeTransition(
            opacity:
                Tween<double>(begin: 0.0, end: 1.0).animate(curvedAnimation),
            child: AlertDialog(
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              contentPadding: EdgeInsets.zero,
              content: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height * 0.8,
                ),
                child: TriageResultModal(
                  triageResult: triageResult,
                  onDismiss: onDismiss,
                  onNewSession: onNewSession,
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final level = triageResult['level'] ?? 'Unknown Level';
    final isArabic = isArabicText(level);
    final levelColor = getLevelColor(level);

    return TriageResultBody(
      level: level,
      concern: triageResult['concern'] ?? 'Unknown',
      recommendation: triageResult['recommendation'] ?? 'Seek medical advice',
      isArabic: isArabic,
      levelColor: levelColor,
      onDismiss: onDismiss,
      onNewSession: onNewSession,
    );
  }
}
