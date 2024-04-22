import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:task_ultimate/Orders/controller/api/delivery_api.dart';
import 'package:task_ultimate/Orders/controller/provider/order_provider.dart';
import 'package:task_ultimate/Orders/controller/provider/state_on_get_new_delivery_bill.dart';
import 'package:task_ultimate/Orders/controller/provider/state_on_get_other_delivery_bill.dart';
import 'package:task_ultimate/Orders/model/delivery_bill.dart';
import 'package:task_ultimate/Orders/view/widgets/bill_item.dart';
import 'package:task_ultimate/Orders/view/widgets/no_bill_item.dart';
import 'package:task_ultimate/Shared/shared_preferances.dart';
import 'package:task_ultimate/language/view/widgets/language_dialog.dart';
import 'package:task_ultimate/utilties/helper.dart';
import 'package:task_ultimate/utilties/theme.dart';
import 'package:task_ultimate/utilties/widgets/default_text_widget.dart';
import 'package:task_ultimate/utilties/widgets/loading_widget.dart';
class BillScreen extends StatelessWidget {

  static String routeName = "/OrdersScreen";

  const BillScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeClass.whiteColor,
      body: Consumer<OrderProvider>(
        builder: (context, orderProvider, _) {
          return Column(
            children: [
              Stack(children: [
                Container(color: ThemeClass.redColor,width: double.infinity, height: 127.h,),
                PositionedDirectional(
                    top: 0,end: 0,
                    child: SvgPicture.asset("assets/images/ic_circle1.svg" ,width: 122.w, height: 128.h,)),
                PositionedDirectional(
                  top: 50.h,end: 16.w,
                  child: Container(
                    width: 24.h, height: 24.w,
                    decoration: BoxDecoration(
                      color: ThemeClass.whiteDarkColor,
                      borderRadius: BorderRadius.circular(5.r),),
                    child: GestureDetector(
                      onTap: (){
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // Return the dialog widget
                            return const LanguageDialog();
                          },
                        );
                      },
                      child: Center(
                        child: Icon(Icons.language, size: 16,
                          color: ThemeClass.greenDarkColor,),
                      ),
                    ),
                  ),
                ),
                PositionedDirectional(
                    top: 20.h,
                    end: 60.w,child: Image.asset("assets/images/deliveryman.png" ,width: 134.w, height: 108.h,)),
                PositionedDirectional(
                  top: 46.h,
                  start: 17.w,child: SizedBox( width: 150.w,
                    child: TextDefaultWidget(title: SharedPref.getUserName(),
                    fontWeight: FontWeight.w500,fontSize: 25.sp,),
                  )),
              ],),
              SizedBox(height: 16.h),
              Container(width: 220.w,height: 36.h,
                decoration: BoxDecoration(
                    color: ThemeClass.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: ThemeClass.greyColor, // Shadow color// Spread radius
                        blurRadius: 6, // Blur radius
                        offset: const Offset(0, 5), // Offset in x and y directions
                      ),
                    ],
                    borderRadius: BorderRadius.circular(18.r)),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: ()=> StateOnGetNewDeliveryBills(context).getNewDeliveryBills(context),
                    child: Container(
                      width: 110.w,
                      height: 36.h,
                      decoration:BoxDecoration(
                          color: orderProvider.newDelivery ? ThemeClass.greenDarkColor : ThemeClass.whiteColor,
                          borderRadius: BorderRadius.circular(18.r)
                      ),
                      child: Center(child: TextDefaultWidget(title: "new".tr, color: orderProvider.newDelivery ?
                      ThemeClass.whiteColor : ThemeClass.greenDarkColor, fontSize: 14.sp,)),
                    ),
                  ),
                  GestureDetector(
                    onTap: ()=> StateOnGetOtherDeliveryBills(context).getOtherDeliveryBills(context),
                    child: Container(
                      width: 110.w,
                      height: 36.h,
                      decoration:BoxDecoration(
                       color: orderProvider.otherDelivery ? ThemeClass.greenDarkColor : ThemeClass.whiteColor,
                       borderRadius: BorderRadius.circular(18.r)
                      ),
                      child: Center(child: TextDefaultWidget(title: "other".tr, color: orderProvider.otherDelivery ?
                      ThemeClass.whiteColor : ThemeClass.greenDarkColor, fontSize: 14.sp,)),
                    ),
                  )
                ],
              ),),
              SizedBox(height: 28.h),
              DeliveryApi().isWaiting ? const Center(child: LoadingAnimationWidget(),):
              ((orderProvider.newDeliveryBills.isEmpty && orderProvider.newDelivery) ||
                  (orderProvider.otherDeliveryBills.isEmpty && orderProvider.otherDelivery))
                  ?  NoBillItem()
                  :  Expanded(
                child: ListView.builder(
                   itemCount: orderProvider.newDelivery == true ?
                   orderProvider.newDeliveryBills.length: orderProvider.otherDeliveryBills.length,
                    itemBuilder: (BuildContext context, int index){
                      return  BillItem(
                          deliveryBill: orderProvider.newDelivery == true ?
                          orderProvider.newDeliveryBills[index]:
                          orderProvider.otherDeliveryBills[index]
                      );
                    }),
              )

            ],
          );
        }
      ),
    );
  }
}
