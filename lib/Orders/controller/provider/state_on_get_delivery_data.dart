import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_ultimate/Orders/controller/api/delivery_api.dart';
import 'package:task_ultimate/Orders/controller/provider/order_provider.dart';
import 'package:task_ultimate/Orders/controller/provider/state_on_get_new_delivery_bill.dart';
import 'package:task_ultimate/Orders/view/bill_screen.dart';
import 'package:task_ultimate/language/provider/app_languages.dart';
import 'package:task_ultimate/utilties/route/navigation_helper.dart';

class StateOnGetDeliveryData{

  OrderProvider orderProvider = OrderProvider();
  AppLanguage langProvider = AppLanguage();

  StateOnGetDeliveryData(BuildContext context){
    orderProvider = Provider.of<OrderProvider>(context, listen: false);
    langProvider = Provider.of<AppLanguage>(context, listen: false);
  }


  Future getDeliveryData(BuildContext context) async {
    NavigationHelper.navigationHandler(context: context, screen: const BillScreen());

    await Future.wait([
      Future.value(DeliveryApi().getDeliveryStatus(context: context, lang: langProvider.appLanguage)),
      Future.value(DeliveryApi().getDeliveryBills(context: context,lang: langProvider.appLanguage)),
    ]);

    orderProvider.setNewDeliver(true);
    StateOnGetNewDeliveryBills(context).getNewDeliveryBills(context);
  }

}