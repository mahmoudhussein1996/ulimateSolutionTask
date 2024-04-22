import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_ultimate/Login/model/login.dart';
import 'package:task_ultimate/Orders/model/delivery_bill.dart';
import 'package:task_ultimate/Orders/model/delivery_status_type.dart';
import 'package:task_ultimate/utilties/helper.dart';

class OrderProvider extends ChangeNotifier{
  factory OrderProvider() {
    _this ??= OrderProvider._();
    return _this!;
  }
  static OrderProvider? _this;
  OrderProvider._();


  List<DeliveryBill> _newDeliveryBills = [];
  List<DeliveryBill> get newDeliveryBills => _newDeliveryBills;
  setNewDeliveryBillItems(List<DeliveryBill> newDeliveryBillItems){
    _newDeliveryBills = newDeliveryBillItems;
    listen();
  }
  List<DeliveryBill> _otherDeliveryBills = [];
  List<DeliveryBill> get otherDeliveryBills => _otherDeliveryBills;
  setOtherDeliveryBillItems(List<DeliveryBill> otherDeliveryBillItems){
    _otherDeliveryBills = otherDeliveryBillItems;
    listen();
  }

  DeliveryBillItems _deliveryBillItems = DeliveryBillItems(deliveryBillItems: []);
  DeliveryBillItems get deliveryBillItems => _deliveryBillItems;
  setDeliveryBillItems(DeliveryBillItems deliveryBillItems){
    _deliveryBillItems = deliveryBillItems;
    listen();
  }

  DeliveryStatusTypeItems _deliveryStatusTypeItems = DeliveryStatusTypeItems();
  DeliveryStatusTypeItems get deliveryStatusTypeItems => _deliveryStatusTypeItems;
  setDeliveryStatusTypeItems(DeliveryStatusTypeItems deliveryStatusTypeItems){
    _deliveryStatusTypeItems = deliveryStatusTypeItems;
    listen();
  }

  bool _newDelivery = false;
  bool get newDelivery =>  _newDelivery;
  setNewDeliver(bool newDelivery){
    _newDelivery = newDelivery;
    _otherDelivery = !newDelivery;
    listen();
  }

  bool _otherDelivery = false;
  bool get otherDelivery =>  _otherDelivery;
  setOtherDeliver(bool otherDelivery){
    _otherDelivery = otherDelivery;
    _newDelivery = !otherDelivery;
    listen();
  }

  /*
   this function has been written like this because i don't know all type of bill delivery status
   getDelivery status type return three type 1,2,3 and there are five type in getDelivery bill items

  */
  String getDeliveryStatus(String deliveryStatusValue){
    // DeliveryStatusType? deliveryStatus = deliveryStatusTypeItems.deliveryStatusTypeItems?.firstWhere((status) =>
    // status.typeNumber.toString() == deliveryStatusValue, orElse: () => DeliveryStatusType());
    //
    // return deliveryStatus?.typeName ?? "";

    String result;

    switch (deliveryStatusValue) {
      case "0":
        result = "delivering".tr;
        break;
      case "1":
        result = "delivered".tr;
        break;
      case "2":
        result = "partial_return".tr;
        break;
      case "3":
        result = "returned".tr;
        break;
      default:
        result = "new".tr;
    }

    return result;
  }

  void listen(){
    notifyListeners();
  }
}