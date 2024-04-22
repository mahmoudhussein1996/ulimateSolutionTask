import 'package:flutter/material.dart';
import 'package:task_ultimate/Login/view/login_screen.dart';
import 'package:task_ultimate/Orders/view/bill_screen.dart';
import 'package:task_ultimate/splash/view/splash_screen.dart';

class Routes
{
  static  Map<String,Widget Function(BuildContext)> routesMap = {
    "/": (context) =>  const SplashScreen(),
    "/LoginScreen": (context) =>  const LoginScreen(),
    "/OrdersScreen": (context) =>  const BillScreen(),
  };
}