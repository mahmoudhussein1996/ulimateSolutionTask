import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_ultimate/Orders/controller/provider/order_provider.dart';

class StateOnGetOtherDeliveryBills{

  OrderProvider orderProvider = OrderProvider();

  StateOnGetOtherDeliveryBills(BuildContext context){
    orderProvider = Provider.of<OrderProvider>(context, listen: false);
  }


  Future getOtherDeliveryBills(BuildContext context) async {
    orderProvider.setOtherDeliver(true);
    orderProvider.setOtherDeliveryBillItems(orderProvider.deliveryBillItems.deliveryBillItems.where((data) => data.deliveryStatusFlag != "4").toList());

    orderProvider.listen();
  }

}