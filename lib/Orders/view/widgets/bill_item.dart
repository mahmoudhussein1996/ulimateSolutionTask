import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:task_ultimate/Orders/controller/provider/order_provider.dart';
import 'package:task_ultimate/Orders/model/delivery_bill.dart';
import 'package:task_ultimate/Orders/view/widgets/divider_widget.dart';
import 'package:task_ultimate/utilties/helper.dart';
import 'package:task_ultimate/utilties/theme.dart';
import 'package:task_ultimate/utilties/widgets/default_text_widget.dart';

class BillItem extends StatelessWidget {
  final DeliveryBill deliveryBill;
  const BillItem({super.key, required this.deliveryBill});

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderProvider>(
      builder: (context, orderProvider, _) {
        return Container(
          width: double.infinity,
          height: 92.h,
          margin: EdgeInsets.symmetric(horizontal: 14.w, vertical: 8.h),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: ThemeClass.whiteColor,
            boxShadow: [
              BoxShadow(
                color: ThemeClass.greyColor, // Shadow color// Spread radius
                blurRadius: 6, // Blur radius
                offset: const Offset(3, 3), // Offset in x and y directions
              ),
            ],
          ),
          child: Row(
            children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 20.w, vertical: 4.h),
                  child: TextDefaultWidget(title: "#${deliveryBill.billNumber}", fontSize: 12.sp, color: ThemeClass.greyColor),
                ),
                SizedBox(height: 8.h),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(width: 12.w),
                    SizedBox(
                      width: 78.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextDefaultWidget(title: "status".tr, fontSize: 10.sp, color: ThemeClass.greyColor),
                          SizedBox(height: 8.h),
                          TextDefaultWidget(title: orderProvider.getDeliveryStatus(deliveryBill.deliveryStatusFlag ?? ""), fontSize: 12.sp,
                              fontWeight: FontWeight.w600,
                              color: deliveryBill.deliveryStatusFlag == "1" ?
                              ThemeClass.greyColor : deliveryBill.deliveryStatusFlag == "4" ?
                              ThemeClass.greenColor: deliveryBill.deliveryStatusFlag == "3" ?
                              ThemeClass.redColor : deliveryBill.deliveryStatusFlag == "2" ?
                              ThemeClass.greenDarkColor : ThemeClass.blueDarkColor),
                        ],
                      ),
                    ),
                    SizedBox(width: 20.w,),
                    const DividerWidget(),
                    SizedBox(width: 10.w,),
                    SizedBox(
                      width: 64.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextDefaultWidget(title: "total_price".tr, fontSize: 10.sp, color: ThemeClass.greyColor),
                          SizedBox(height: 5.h),
                          TextDefaultWidget(title: "${(double.parse(deliveryBill.billAmount ?? "0") +
                              double.parse(deliveryBill.taxAmount ?? "0")).toStringAsFixed(0)} ${"le".tr}", fontSize: 12.sp, fontWeight: FontWeight.w600,color: ThemeClass.greenDarkColor),
                        ],
                      ),
                    ),
                    SizedBox(width: 10.w,),
                    const DividerWidget(),
                    SizedBox(width: 16.w,),
                    SizedBox(
                      width: 74.w,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextDefaultWidget(title: "date".tr, fontSize: 10.sp, color: ThemeClass.greyColor),
                          SizedBox(height: 4.h),
                          TextDefaultWidget(title: "${deliveryBill.billDate}", fontSize: 12.sp, fontWeight: FontWeight.w600,color: ThemeClass.greenDarkColor),
                        ],
                      ),
                    ),
                    SizedBox(width: 16.w,),
                  ],
                )
              ],
            ),
            const Spacer(),
            Container(
              width: 44.w,
              height: 92.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(8.r), topRight: Radius.circular(8.r)),
                color: deliveryBill.deliveryStatusFlag == "1" ?
                ThemeClass.greyColor : deliveryBill.deliveryStatusFlag == "4" ?
                ThemeClass.greenColor: deliveryBill.deliveryStatusFlag == "3" ?
                ThemeClass.redColor : deliveryBill.deliveryStatusFlag == "2" ?
                ThemeClass.greenDarkColor : ThemeClass.blueDarkColor
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 28.w, height: 22.h,
                    child: TextDefaultWidget(
                    title: "order_details".tr, fontSize: 8.sp,
                    fontWeight: FontWeight.w500,)),
                  SizedBox(height: 8.h),
                  Icon(Icons.arrow_forward_ios, color: ThemeClass.whiteColor, size: 10,)
                ],
              ),
            )
          ],),
        );
      }
    );
  }
}
