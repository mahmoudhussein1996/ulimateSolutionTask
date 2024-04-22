import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task_ultimate/Orders/model/delivery_bill.dart';
import 'package:task_ultimate/Orders/view/widgets/divider_widget.dart';
import 'package:task_ultimate/utilties/helper.dart';
import 'package:task_ultimate/utilties/theme.dart';
import 'package:task_ultimate/utilties/widgets/default_text_widget.dart';

class NoBillItem extends StatelessWidget {
  const NoBillItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 47.h),
       SvgPicture.asset("assets/images/ic_emptyorder.svg", width: 224.w, height: 184.h,),
       SizedBox(height: 47.h),
       TextDefaultWidget(title: "no_order".tr, fontSize: 23.sp, color: ThemeClass.blackColor, fontWeight: FontWeight.w600),
       SizedBox(height: 16.h),
       TextDefaultWidget(title: "no_order_description".tr, fontSize: 16.sp, color: ThemeClass.blackColor, fontWeight: FontWeight.w500)
      ],
    );
  }
}
