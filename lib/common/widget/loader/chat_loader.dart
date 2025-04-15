import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';

class ChatLoader extends StatefulWidget {
  const ChatLoader({super.key});

  @override
  State<ChatLoader> createState() => _ChatLoaderState();
}

class _ChatLoaderState extends State<ChatLoader> with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late AnimationController _controller3;

  late Animation<double> _sizeAnimation1;
  late Animation<double> _sizeAnimation2;
  late Animation<double> _sizeAnimation3;

  late Animation<double> _opacityAnimation1;
  late Animation<double> _opacityAnimation2;
  late Animation<double> _opacityAnimation3;

  @override
  void initState() {
    super.initState();

    _controller1 = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..repeat(reverse: true);

    _sizeAnimation1 = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _controller1, curve: Curves.easeInOut),
    );

    _opacityAnimation1 = Tween<double>(begin: 1.0, end: 0.4).animate(
      CurvedAnimation(parent: _controller1, curve: Curves.easeInOut),
    );

    _controller2 = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    Future.delayed(const Duration(milliseconds: 200), () {
      _controller2.repeat(reverse: true);
    });

    _sizeAnimation2 = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _controller2, curve: Curves.easeInOut),
    );

    _opacityAnimation2 = Tween<double>(begin: 0.7, end: 0.3).animate(
      CurvedAnimation(parent: _controller2, curve: Curves.easeInOut),
    );

    _controller3 = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );

    Future.delayed(const Duration(milliseconds: 400), () {
      _controller3.repeat(reverse: true);
    });

    _sizeAnimation3 = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _controller3, curve: Curves.easeInOut),
    );

    _opacityAnimation3 = Tween<double>(begin: 0.4, end: 0.1).animate(
      CurvedAnimation(parent: _controller3, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30.h,
      width: 70.w,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.mainAppColor.withOpacity(0.15),
            blurRadius: 10,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedBuilder(
            animation: _controller1,
            builder: (context, child) {
              return Transform.scale(
                scale: _sizeAnimation1.value,
                child: Opacity(
                  opacity: _opacityAnimation1.value,
                  child: Container(
                    width: 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: AppColors.mainAppColor,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(width: 6.w),
          AnimatedBuilder(
            animation: _controller2,
            builder: (context, child) {
              return Transform.scale(
                scale: _sizeAnimation2.value,
                child: Opacity(
                  opacity: _opacityAnimation2.value,
                  child: Container(
                    width: 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: AppColors.mainAppColor.withOpacity(0.7),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              );
            },
          ),
          SizedBox(width: 6.w),
          AnimatedBuilder(
            animation: _controller3,
            builder: (context, child) {
              return Transform.scale(
                scale: _sizeAnimation3.value,
                child: Opacity(
                  opacity: _opacityAnimation3.value,
                  child: Container(
                    width: 8.w,
                    height: 8.h,
                    decoration: BoxDecoration(
                      color: AppColors.mainAppColor.withOpacity(0.4),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
