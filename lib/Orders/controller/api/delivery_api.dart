import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:task_ultimate/Login/controller/provider/login_provider.dart';
import 'package:task_ultimate/Login/model/login.dart';
import 'package:task_ultimate/Orders/controller/provider/order_provider.dart';
import 'package:task_ultimate/Orders/model/delivery_bill.dart';
import 'package:task_ultimate/Orders/model/delivery_status_type.dart';
import 'package:task_ultimate/services/api_handler/general_api_state.dart';
import 'package:task_ultimate/services/api_handler/http_request_handler.dart';
import 'package:task_ultimate/services/api_handler/urls.dart';

class DeliveryApi extends GeneralApiState
{
  static final DeliveryApi deliveryApi = DeliveryApi._internal();
  factory DeliveryApi() {
    return deliveryApi;
  }

  DeliveryApi._internal();

  Future getDeliveryStatus({required BuildContext context, required String lang}) async {

    OrderProvider orderProvider = Provider.of<OrderProvider>(context, listen: false);

    setWaiting();
    await HttpHelper().callService(
        url:UltimateEndPoints.deliveryStatusItem,
        responseType:RequestType.post,
        body: {
          "Value": {
            "P_LANG_NO":  lang == "ar" ? "1" : "2",
          }
        },
      authorization:true).then((value) {
      setHasData();
      orderProvider.setDeliveryStatusTypeItems(DeliveryStatusTypeItems.fromJson(value));
    }).catchError((error, stackTrace) {
      debugPrint("catchError --------------> ${UltimateEndPoints.deliveryStatusItem}\n error= $error");
      if(error.toString()=="internet"){
        setConnectionError();
      }
      else{
        setHasError();
        setError(error);
      }

    });
  }

  Future getDeliveryBills({required BuildContext context, required String lang}) async {

    OrderProvider orderProvider = Provider.of<OrderProvider>(context, listen: false);

    setWaiting();
    await HttpHelper().callService(
        url:UltimateEndPoints.deliveryBillItem,
        responseType:RequestType.post,
        body: {
          "Value": {
            "P_DLVRY_NO": "1010",
            "P_LANG_NO": lang == "ar" ? "1" : "2",
            "P_BILL_SRL": "",
            "P_PRCSSD_FLG": ""
          }
        },
        authorization:true).then((value) {
      setHasData();
      orderProvider.setDeliveryBillItems(DeliveryBillItems.fromJson(value));
    }).catchError((error, stackTrace) {
      debugPrint("catchError --------------> ${UltimateEndPoints.deliveryBillItem}\n error= $error");
      if(error.toString()=="internet"){
        setConnectionError();
      }
      else{
        setHasError();
        setError(error);
      }

    });
  }
}
