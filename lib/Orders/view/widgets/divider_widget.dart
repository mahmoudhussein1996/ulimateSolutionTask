import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task_ultimate/utilties/theme.dart';

class DividerWidget extends StatelessWidget {
  const DividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ThemeClass.greyColor,
      width: 1.w, height: 48.h,
    );
  }
}
