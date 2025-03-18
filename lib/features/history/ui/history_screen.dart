import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';
import 'package:graduation/features/history/ui/widgets/empty_history.dart';
import 'package:graduation/features/history/ui/widgets/history_card.dart';
import 'package:graduation/common/theme/text.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HistoryScreen extends StatefulWidget {
  HistoryScreen({super.key});

  @override
  HistoryScreenState createState() => HistoryScreenState();
}

class HistoryScreenState extends State<HistoryScreen>
    with SingleTickerProviderStateMixin {
  bool isEmpty = true; // This will be removed when you have users with data.

  late AnimationController _fadeController;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    _fadeController.forward();
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Column(
      children: [
        TextAndIcon(
          iconPath: "assets/icons/history.png",
          label: loc.medical_history_bottomsheet_title,
          description: loc.medical_history_bottomsheet_description,
          onPressed: () {},
        ),
        SizedBox(height: 20.h),
        isEmpty
            ? const EmptyHistory()
            : FadeTransition(
                opacity: _fadeAnimation,
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.7,
                  child: MedicalHistoryCards(
                    medicalHistoryData: medicalHistoryData,
                  ),
                ),
              ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
