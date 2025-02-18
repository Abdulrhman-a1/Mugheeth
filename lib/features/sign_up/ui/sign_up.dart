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

import '../../../common/widget/pop_up/error_popup.dart';

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
                    errorPopUp(context, state.message);
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
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
}
