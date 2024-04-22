import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_ultimate/Orders/controller/provider/order_provider.dart';

class StateOnGetNewDeliveryBills{

  OrderProvider orderProvider = OrderProvider();

  StateOnGetNewDeliveryBills(BuildContext context){
    orderProvider = Provider.of<OrderProvider>(context, listen: false);
  }


  Future getNewDeliveryBills(BuildContext context) async {
    /*
      i assumed that new delivery bills equal 4 and others bills does not equal 4
      because there no flag in api collection to know flag of new bills
   */
    orderProvider.setNewDeliver(true);
    orderProvider.setNewDeliveryBillItems(orderProvider.deliveryBillItems.deliveryBillItems.where((data) => data.deliveryStatusFlag == "4").toList());

    orderProvider.listen();
  }

}