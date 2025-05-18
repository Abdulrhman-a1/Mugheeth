import 'package:flutter/material.dart';
import 'package:graduation/common/routing/extensions.dart';
import 'package:graduation/common/widget/buttons/triage_buttons.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';
import 'package:graduation/common/widget/pop_up/error_popup.dart';
import 'package:graduation/data/auth/service/auth_service.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class TriageResultBody extends StatelessWidget {
  final String level;
  final String concern;
  final String recommendation;
  final bool isArabic;
  final Color levelColor;
  final VoidCallback onDismiss;
  final VoidCallback onNewSession;

  const TriageResultBody({
    super.key,
    required this.level,
    required this.concern,
    required this.recommendation,
    required this.isArabic,
    required this.levelColor,
    required this.onDismiss,
    required this.onNewSession,
  });

  @override
  Widget build(BuildContext context) {
    final AuthService authService = AuthService();
    final loc = AppLocalizations.of(context)!;

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: levelColor, width: 2),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 120,
                      height: 5,
                      margin: const EdgeInsets.only(bottom: 20),
                      decoration: BoxDecoration(
                        color: levelColor.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: const Duration(seconds: 1),
                      builder: (context, value, child) {
                        return Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                color: levelColor.withOpacity(0.3 * value),
                                blurRadius: 20 * value,
                                spreadRadius: 5 * value,
                              ),
                            ],
                          ),
                          child: child,
                        );
                      },
                      child: Icon(Icons.warning_amber_rounded,
                          color: levelColor, size: 68),
                    ),
                    const SizedBox(height: 16),
                    TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 600),
                      curve: Curves.easeOut,
                      builder: (context, value, child) {
                        return Transform.translate(
                          offset: Offset(0, 20 * (1 - value)),
                          child: Opacity(opacity: value, child: child),
                        );
                      },
                      child: Text(
                        level,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: levelColor,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    TweenAnimationBuilder(
                      tween: Tween<double>(begin: 0, end: 1),
                      duration: const Duration(milliseconds: 800),
                      curve: Curves.easeOut,
                      builder: (context, value, child) {
                        return Opacity(opacity: value, child: child);
                      },
                      child: Column(
                        children: [
                          infoContiner(
                            icon: "assets/icons/history.png",
                            label: isArabic ? "الاحتمال الطبي" : "Concern",
                            value: concern,
                          ),
                          const SizedBox(height: 12),
                          infoContiner(
                            icon: "assets/icons/feedback.png",
                            label: isArabic ? "التوصية:" : "Recommendation:",
                            value: recommendation,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
          TriageButtons(
            onDismiss: onDismiss,
            isArabic: isArabic,
            onNewSession: () {
              if (authService.userNameNotifier.value != null &&
                  authService.userNameNotifier.value!.isNotEmpty) {
                onNewSession();

                context.pop();
              } else {
                context.pop();
                showToastMessage(
                    context,
                    loc.pleaselogin,
                    isError: false,
                    "assets/icons/key.png");
              }
            },
            levelColor: levelColor,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget infoContiner({
    required String? icon,
    required String label,
    required String value,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: levelColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          icon != null
              ? TextAndIcon(
                  iconPath: icon,
                  label: label,
                  description: '',
                  onPressed: () {})
              : Row(
                  children: [
                    Icon(Icons.recommend, color: levelColor, size: 20),
                    const SizedBox(width: 8),
                    Text(label,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
          const SizedBox(height: 6),
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
