import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:graduation/common/widget/animation/slider_animation.dart';
import 'package:graduation/common/widget/custom_shape/text_and_icon.dart';

/// The content of mugheeth features popup with staggered animation.
class MugheethFeatures extends StatelessWidget {
  const MugheethFeatures({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedItem(
          index: 0,
          child: TextAndIcon(
            iconPath: 'assets/icons/prioritiz.png',
            label: 'تصنيف الأولوية الطبية',
            description:
                'بناءً على الأعراض المدخلة، يقوم التطبيق بتصنيف الحالة وفقًا لمقياس الفرز الكندي (CTAS)، مما يساعد المستخدم في معرفة ما إذا كان يحتاج إلى رعاية طبية فورية أو يمكنه الانتظار',
            onPressed: () {},
          ),
        ),
        SizedBox(height: 25.h),
        AnimatedItem(
          index: 1,
          child: TextAndIcon(
            iconPath: 'assets/icons/chat.png',
            label: 'تقييم فوري',
            description:
                'يمكن للمستخدم إدخال الأعراض التي يعاني منها ليقوم التطبيق بتحليلها باستخدام الذكاء الاصطناعي وتقديم تقييم لمستوى خطورتها.',
            onPressed: () {},
          ),
        ),
        SizedBox(height: 25.h),
        AnimatedItem(
          index: 2,
          child: TextAndIcon(
            iconPath: 'assets/icons/piin.png',
            label: 'خريطة المستشفيات',
            description:
                'يمكن للمستخدم العثور على أقرب المستشفيات والمراكز الطبية بناءً على موقعه الجغرافي، مع عرض أوقات الانتظار المتوقعة لكل مستشفى.',
            onPressed: () {},
          ),
        ),
        SizedBox(height: 25.h),
        AnimatedItem(
          index: 3,
          child: TextAndIcon(
            iconPath: 'assets/icons/medical-records.png',
            label: 'سجل طبي إلكتروني',
            description:
                'يتيح التطبيق للمستخدمين حفظ تاريخهم الصحي، الأعراض السابقة، والتقييمات الطبية، مما يسهل تتبع الحالة الصحية مع مرور الوقت.',
            onPressed: () {},
          ),
        ),
        SizedBox(height: 25.h),
        AnimatedItem(
          index: 4,
          child: TextAndIcon(
            iconPath: 'assets/icons/language.png',
            label: 'دعم متعدد اللغات',
            description:
                'التطبيق متاح بعدة لغات لضمان سهولة الاستخدام لمختلف الفئات والمستخدمين.',
            onPressed: () {},
          ),
        ),
        // SizedBox(height: 25.h),
        // SizedBox(
        //   width: MediaQuery.of(context).size.width * 0.9,
        //   height: MediaQuery.of(context).size.height * 0.06,
        //   child: TextButton(
        //     onPressed: () {},
        //     style: TextButton.styleFrom(
        //       overlayColor: Colors.transparent,
        //       backgroundColor: Colors.transparent,
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(10.sp),
        //         side: BorderSide(color: AppColors.mainAppColor, width: 1.5.sp),
        //       ),
        //     ),
        //     child: Text(
        //       "إبدا",
        //       style: TextStyles.onboardingDesc.copyWith(
        //         fontWeight: FontWeight.normal,
        //       ),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
