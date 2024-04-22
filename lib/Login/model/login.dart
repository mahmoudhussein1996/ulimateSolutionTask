import 'package:task_ultimate/services/api_handler/result_model.dart';

class Login{
  String? name;
  ResultModel? result;

  Login(
      {
        this.name,
        this.result,
      }
      );

  factory Login.fromJson(Map<String, dynamic> json)
  {
    return Login(
      name: json["Data"]["DeliveryName"],
      result: ResultModel.fromJson(json['Result']),
    );
  }
}