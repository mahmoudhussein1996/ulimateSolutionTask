import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:task_ultimate/Login/controller/provider/login_provider.dart';
import 'package:task_ultimate/Login/controller/provider/state_on_login.dart';
import 'package:task_ultimate/language/view/widgets/language_dialog.dart';
import 'package:task_ultimate/utilties/helper.dart';
import 'package:task_ultimate/utilties/theme.dart';
import 'package:task_ultimate/utilties/widgets/custom_button_widget.dart';
import 'package:task_ultimate/utilties/widgets/custom_textfeild_widget.dart';
import 'package:task_ultimate/utilties/widgets/default_text_widget.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/LoginScreen";

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeClass.whiteColor,
      key: _scaffoldKey,
      body: Consumer<LoginProvider>(
        builder: (context, loginProvider, _) {
          return Stack(
            children: [
              PositionedDirectional(
                top: 0,end: 0,
                  child: SvgPicture.asset("assets/images/ic_circle.svg" ,width: 122.w, height: 128.h,)),
              PositionedDirectional(
                top: 50.h,end: 16.w,
                child: IconButton(icon: Icon(Icons.language, size: 28,
                  color: ThemeClass.whiteColor,), onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return const LanguageDialog();
                    },
                  );
                },),
              ),
              PositionedDirectional(
                top: 56.h,
                start: 26.w,child: SvgPicture.asset("assets/images/Group3915.svg" ,width: 170.w, height: 74.h,)),
              PositionedDirectional(
                top: 262.h,
                start: 0, end: 0,
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 26.w),
                  child: Column(children: [
                    TextDefaultWidget(title: "welcome_back".tr,
                      fontWeight: FontWeight.w600,
                      color: ThemeClass.greenDarkColor,fontSize: 29.sp,),
                    SizedBox(height: 12.h),
                    TextDefaultWidget(title: "login_hint".tr,
                      fontWeight: FontWeight.w400,
                      color: ThemeClass.greenDarkColor,fontSize: 12.sp,),
                    SizedBox(height: 44.h),
                    CustomTextFieldWidget(backGroundColor: ThemeClass.whiteDarkColor,
                      hint: "user_id".tr,
                      controller: loginProvider.userIdController,
                      borderRadiusValue: 22.r,),
                    SizedBox(height: 8.h),
                    CustomTextFieldWidget(backGroundColor: ThemeClass.whiteDarkColor,
                      hint: "password".tr,
                      controller: loginProvider.passwordController,
                      borderRadiusValue: 22.r,),
                    SizedBox(height: 27.h),
                    Align(
                      alignment: AlignmentDirectional.topEnd,
                      child: TextDefaultWidget(title: "show_more".tr,
                        fontWeight: FontWeight.w600,
                        color: ThemeClass.greenDarkColor,fontSize: 14.sp,),
                    ),
                    SizedBox(height: 24.h),
                    CustomButton(title: "login".tr, backgroundColor: ThemeClass.greenDarkColor,onTap: ()=> StateOnClickLogin(context).login(context),)

                  ],),
                ),
              ),
              PositionedDirectional(
                start: 0, end: 0,
                bottom: 26.w,child: SvgPicture.asset("assets/images/delivery.svg" ,width: 195.w, height: 170.h,)),
            ],
          );
        }
      ),
    );
  }
}
