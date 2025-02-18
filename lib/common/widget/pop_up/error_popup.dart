import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../theme/colors.dart';

void errorPopUp(BuildContext context, String message) {
  FToast fToast = FToast();
  fToast.init(context);

  Widget toast = FadeInDown(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 6.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.sp),
        color: AppColors.chatScreenGrey,
        border: Border.all(color: AppColors.mainAppGrey.withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            "assets/icons/warning.png",
            width: 20,
            height: 20,
          ),
          SizedBox(width: 20.w),
          Expanded(
            child: Text(
              //i'll change this when we handle error to show the actual error.
              message,
              style: TextStyle(color: Colors.black, fontSize: 14.sp),
            ),
          ),
        ],
      ),
    ),
  );

  fToast.showToast(
    child: toast,
    gravity: ToastGravity.TOP,
    toastDuration: const Duration(seconds: 2),
  );
}
