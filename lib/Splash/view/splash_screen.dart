import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_ultimate/Login/view/login_screen.dart';
import 'package:task_ultimate/Orders/controller/provider/state_on_get_delivery_data.dart';
import 'package:task_ultimate/Orders/view/bill_screen.dart';
import 'package:task_ultimate/Shared/shared_preferances.dart';
import 'package:task_ultimate/utilties/route/navigation_helper.dart';
import 'package:task_ultimate/utilties/theme.dart';

class SplashScreen extends StatefulWidget {
  static String routeName = "/";

  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    init();
    super.initState();
  }

  Future init() async {
    await Future.delayed(const Duration(seconds: 2));
    if (SharedPref.isUserLogIn()) {
      StateOnGetDeliveryData(context).getDeliveryData(context);
    } else {
      NavigationHelper.navigationHandler(context: context, screen: LoginScreen());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeClass.lightBlueColor,
      key: _scaffoldKey,
      body: SizedBox(
        width: double.infinity,
        child: Stack(
          children: [
            Positioned(bottom: 40.h,child: SvgPicture.asset("assets/images/Path1.svg" ,width: 274.w, height: 246.h,)),
            Positioned(
             bottom: 20.h,
             right: 0.w,
             left: 0.w,
             child: SvgPicture.asset("assets/images/Group8.svg", width: 270.w, height: 210.h,)),
            Positioned(
             top: 290.h,
             right: 0.w,
             left: 0.w,
             child: SvgPicture.asset("assets/images/Group3915.svg", width: 276.w, height: 112.h,)),
          ],
        ),
      ),
    );
  }
}
