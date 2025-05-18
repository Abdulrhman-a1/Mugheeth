import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:graduation/common/theme/colors.dart';

class ChatLoader extends StatefulWidget {
  const ChatLoader({super.key});

  @override
  State<ChatLoader> createState() => _ChatLoaderState();
}

class _ChatLoaderState extends State<ChatLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    )..repeat(reverse: true);

    _fadeAnimation = Tween<double>(begin: 0.3, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final text = loc.loading_thinking;

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: Text(
          "$text 🚀",
          style: TextStyle(
            fontSize: 14.sp,
            color: AppColors.mainAppColor,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
