
import 'package:task_ultimate/Orders/model/delivery_status_type.dart';
import 'package:task_ultimate/Orders/model/delivery_status_type.dart';
import 'package:task_ultimate/services/api_handler/result_model.dart';

class DeliveryStatusType
{
  String? typeName;
  String? typeNumber;

  DeliveryStatusType(
      {
        this.typeName,
        this.typeNumber,
      }
      );

  factory DeliveryStatusType.fromJson(Map<String, dynamic> json)
  {
    return DeliveryStatusType(
      typeName: json['TYP_NM'] ?? "",
      typeNumber: json['TYP_NO'] ?? "",
    );
  }
}

class DeliveryStatusTypeItems
{
  List<DeliveryStatusType>? deliveryStatusTypeItems;
  ResultModel? result;

  DeliveryStatusTypeItems(
      {
        this.deliveryStatusTypeItems,
        this.result,
      }
      );

  factory DeliveryStatusTypeItems.fromJson(Map<String, dynamic> json)
  {
    return DeliveryStatusTypeItems(
      deliveryStatusTypeItems: json["Data"]["DeliveryStatusTypes"] == null ? [] : List<DeliveryStatusType>.from(json["Data"]["DeliveryStatusTypes"]!.map((x) => DeliveryStatusType.fromJson(x))),
      result: ResultModel.fromJson(json['Result']),
    );
  }
}