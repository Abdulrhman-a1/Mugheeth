import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/widget/animation/slider_animation.dart';

class OTPform extends StatelessWidget {
  const OTPform({
    super.key,
    required int digitCount,
  }) : _digitCount = digitCount;

  final int _digitCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(
        _digitCount,
        (index) => Column(
          children: [
            AnimatedItem(
              index: index,
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.mainAppGrey),
                  borderRadius: BorderRadius.circular(8),
                ),
                alignment: Alignment.center,
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  maxLength: 1,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    counterText: '',
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty && index < _digitCount - 1) {
                      FocusScope.of(context).nextFocus();
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
