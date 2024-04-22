
import 'package:task_ultimate/services/api_handler/result_model.dart';

class DeliveryBill
{
  String? billAmount;
  String? billDate;
  String? billNumber;
  String? billSerial;
  String? billType;
  String? billTime;
  String? customerName;
  String? customerAddress;
  String? customerApartmentNumber;
  String? customerBuildNumber;
  String? customerFloorNumber;
  String? deliveryAmount;
  String? deliveryStatusFlag;
  String? latitude;
  String? longitude;
  String? mobileNumber;
  String? regionName;
  String? taxAmount;

  DeliveryBill(
      {
        this.billAmount,
        this.billDate,
        this.billNumber,
        this.billSerial,
        this.billType,
        this.billTime,
        this.customerName,
        this.customerAddress,
        this.customerApartmentNumber,
        this.customerBuildNumber,
        this.customerFloorNumber,
        this.deliveryAmount,
        this.deliveryStatusFlag,
        this.latitude,
        this.longitude,
        this.mobileNumber,
        this.regionName,
        this.taxAmount,
      }
      );

  factory DeliveryBill.fromJson(Map<String, dynamic> json)
  {
    return DeliveryBill(
      billAmount: json['BILL_AMT'] ?? "",
      billDate: json['BILL_DATE'] ?? "",
      billNumber: json['BILL_NO'] ?? "",
      billSerial: json['BILL_SRL'] ?? "",
      billType: json['BILL_TYPE'] ?? "",
      billTime: json['BILL_TIME'] ?? "",
      customerName: json['CSTMR_NM'] ?? "",
      customerAddress: json['CSTMR_ADDRSS'] ?? "",
      customerApartmentNumber: json['CSTMR_APRTMNT_NO'] ?? "",
      customerBuildNumber: json['CSTMR_BUILD_NO'] ?? "",
      customerFloorNumber: json['CSTMR_FLOOR_NO'] ?? "",
      deliveryAmount: json['DLVRY_AMT'] ?? "",
      deliveryStatusFlag: json['DLVRY_STATUS_FLG'] ?? "",
      latitude: json['LATITUDE'] ?? "",
      longitude: json['LONGITUDE'] ?? "",
      mobileNumber: json['MOBILE_NO'] ?? "",
      regionName: json['RGN_NM'] ?? "",
      taxAmount: json['TAX_AMT'] ?? "",
    );
  }
}

class DeliveryBillItems{
  List<DeliveryBill> deliveryBillItems  =  [];
  ResultModel? result;

  DeliveryBillItems(
      {
        required this.deliveryBillItems,
        this.result,
      }
      );

  factory DeliveryBillItems.fromJson(Map<String, dynamic> json)
  {
    return DeliveryBillItems(
      deliveryBillItems: json["Data"]["DeliveryBills"] == null ? [] : List<DeliveryBill>.from(json["Data"]["DeliveryBills"]!.map((x) => DeliveryBill.fromJson(x))),
      result: ResultModel.fromJson(json['Result']),
    );
  }
}