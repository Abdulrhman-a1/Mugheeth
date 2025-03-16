import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/widget/custom_shape/welcome_text.dart';
import 'package:graduation/common/widget/loader/progress.dart';
import 'package:graduation/data/auth/bloc/auth_bloc.dart';
import 'package:graduation/data/auth/bloc/auth_state.dart';
import 'package:graduation/features/sign_up/ui/widgets/sign_up_form.dart';
import '../../../common/widget/pop_up/error_popup.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

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
          WelcomeText(
            title: loc.welcome_login_title,
            desc: loc.welcome_login_description,
          ),
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
                    // إغلاق اللودر إذا كان مفتوحًا
                    if (Navigator.canPop(context)) {
                      Navigator.of(context).pop();
                    }
                    showToastMessage(
                        context, state.message, "assets/icons/warning.png");
                  } else if (state is AuthSuccess) {
                    // إغلاق جميع النوافذ المنبثقة والانتقال إلى الشاشة الرئيسية
                    Navigator.of(context).pushNamedAndRemoveUntil(
                        '/chat', (Route<dynamic> route) => false);
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
