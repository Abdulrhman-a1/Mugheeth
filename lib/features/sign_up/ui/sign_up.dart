import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/widget/custom_shape/welcome_text.dart';
import 'package:graduation/data/auth/bloc/auth_bloc.dart';
import 'package:graduation/features/sign_up/ui/widgets/sign_up_form.dart';
import '../../../main.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.sp),
          topRight: Radius.circular(10.sp),
        ),
      ),
      padding: EdgeInsets.all(25.0.sp),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const WelcomeText(
                title: "نورت مُغيث!", desc: "قم بإنشاء حساب جديد"),

            // ✅ BlocConsumer to handle UI state changes
            BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthFailure) {
                  debugPrint("❌ Auth Failure: ${state.message}");

                  // ✅ Show Snackbar using global key (above BottomSheet)
                  scaffoldMessengerKey.currentState?.showSnackBar(
                    SnackBar(
                      content: Text(state.message),
                      backgroundColor: Colors.red,
                      duration: const Duration(seconds: 3),
                      behavior: SnackBarBehavior.floating,
                    ),
                  );
                } else if (state is AuthSuccess) {
                  debugPrint("✅ Auth Success: Navigating to main screen");

                  Future.delayed(const Duration(milliseconds: 150), () {
                    if (context.mounted) {
                      Navigator.of(context).pop(); // Close BottomSheet
                      scaffoldMessengerKey.currentState?.showSnackBar(
                        const SnackBar(
                          content: Text("🎉 تم إنشاء الحساب بنجاح"),
                          backgroundColor: Colors.green,
                        ),
                      );
                    }
                  });
                }
              },
              builder: (context, state) {
                return SignUpForm();
              },
            ),
            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}
