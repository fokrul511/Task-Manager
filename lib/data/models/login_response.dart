import 'package:task_manager/data/models/user_data.dart';

class LoginResponse {
  String? status;
  String? token;
  UserData? data;

  LoginResponse({this.status, this.token, this.data});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    token = json['token'];
    data = json['data'] != null ? UserData.fromJson(json['data']) : null;
  }
}
