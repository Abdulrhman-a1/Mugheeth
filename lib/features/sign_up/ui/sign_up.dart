import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:graduation/common/theme/colors.dart';
import 'package:graduation/common/widget/custom_shape/welcome_text.dart';
import 'package:graduation/common/widget/loader/progress.dart';
import 'package:graduation/data/auth/bloc/auth_bloc.dart';
import 'package:graduation/features/sign_up/ui/widgets/sign_up_form.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.sp),
          topRight: Radius.circular(10.sp),
        ),
      ),
      padding: EdgeInsets.all(25.0.sp),
      child: Column(
        children: [
          const WelcomeText(title: "نورت مُغيث!", desc: "قم بإنشاء حساب جديد"),
          Expanded(
            child: SingleChildScrollView(
              child: BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthLoading) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => const Center(
                        child: BouncingLogoLoader(),
                      ),
                    );
                  } else if (state is AuthFailure) {
                    Navigator.of(context).pop();
                    errorPopUp(context);
                  } else if (state is AuthSuccess) {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                  }
                },
                builder: (context, state) {
                  return const SignUpForm();
                },
              ),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }

  void errorPopUp(BuildContext context) {
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
                "حدث خطأ ما، يرجى المحاولة مرة أخرى",
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
}
