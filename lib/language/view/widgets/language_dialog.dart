import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:task_ultimate/language/provider/app_languages.dart';
import 'package:task_ultimate/utilties/helper.dart';
import 'package:task_ultimate/utilties/theme.dart';
import 'package:task_ultimate/utilties/widgets/custom_button_widget.dart';
import 'package:task_ultimate/utilties/widgets/default_text_widget.dart';


class LanguageDialog extends StatelessWidget {
  const LanguageDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<AppLanguage>(
      builder: (context, appLang, _) {
        return SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: 195.h,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                color: ThemeClass.whiteDark2Color
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                TextDefaultWidget(title: "choose_language".tr, color: ThemeClass.greenDarkColor,fontSize: 12.sp, fontWeight: FontWeight.w600),
                SizedBox(height: 20.h),
                Row(children: [
                  GestureDetector(onTap: (){
                    appLang.setArabicSelected(true);
                  },child:  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                    width: 145.w, height: 50.h,
                    decoration: BoxDecoration(
                        color: appLang.arabicSelected ? ThemeClass.greenLiteColor : ThemeClass.whiteColor,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: appLang.arabicSelected ? ThemeClass.greenColor : ThemeClass.blueDarkColor ,width: .2)
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/images/ArabicFlag.svg", width: 20.w, height: 20.h,),
                        SizedBox(width: 10.w),
                        Column(children: [
                          Expanded(child: TextDefaultWidget(title: "العربية", fontSize: 12.w, color: ThemeClass.blackColor,fontWeight: FontWeight.w600,)),
                          SizedBox(height: 2.h),
                          Expanded(child: TextDefaultWidget(title: "Arabic", fontSize: 10.w,color: ThemeClass.blackColor,fontWeight: FontWeight.w500,)),
                        ],)
                      ],
                    ),
                  )),
                  SizedBox(width: 10.w),
                  GestureDetector(onTap: (){
                    appLang.setEnglishSelected(true);
                  },child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 12.h),
                    width: 145.w, height: 50.h,
                    decoration: BoxDecoration(
                        color: appLang.englishSelected ? ThemeClass.greenLiteColor : ThemeClass.whiteColor,
                        borderRadius: BorderRadius.circular(12.r),
                        border: Border.all(color: appLang.englishSelected ? ThemeClass.greenColor : ThemeClass.blueDarkColor ,width: .2)
                    ),
                    child: Row(
                      children: [
                        SvgPicture.asset("assets/images/EnglishFlag.svg", width: 20.w, height: 20.h,),
                        SizedBox(width: 10.w),
                        Column(children: [
                          Expanded(child: TextDefaultWidget(title: "English", fontSize: 12.w, color: ThemeClass.blackColor,fontWeight: FontWeight.w600,)),
                          SizedBox(height: 2.h),
                          Expanded(child: TextDefaultWidget(title: "English", fontSize: 10.w, color: ThemeClass.blackColor,fontWeight: FontWeight.w500,)),
                        ],)

                      ],
                    ),
                  )),
                ],),
                SizedBox(height: 20.h),
                CustomButton(title: "apply".tr, backgroundColor: ThemeClass.greenDarkColor,radius: 12.r,onTap: (){
                  Navigator.pop(context);
                  if(appLang.arabicSelected == true){
                    appLang.changeLanguage(lang: "ar");
                  }
                  else{
                    appLang.changeLanguage(lang: "en");
                  }
                })
              ],
            ),
          ),
        );
      }
    );
  }
}
