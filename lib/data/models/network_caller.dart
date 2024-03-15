import 'dart:convert';
import 'dart:developer';

import 'package:task_manager/data/service/response_object.dart';
import 'package:http/http.dart';

class NetworkCaller {
  static Future<ResponseObject> getRequest(String url) async {
    try {
      final Response response = await get(Uri.parse(url));
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        final decodeResponse = jsonDecode(response.body);
        return ResponseObject(
            statusCode: 200, responsBody: decodeResponse, isSuccess: true);
      } else {
        return ResponseObject(
            statusCode: response.statusCode, responsBody: "", isSuccess: false);
      }
    } catch (e) {
      log(e.toString());
      return ResponseObject(
          isSuccess: false,
          statusCode: -1,
          responsBody: "",
          errorMessage: e.toString());
    }
  }

  static Future<ResponseObject> postRequest(
      String url, Map<String, dynamic> body) async {
    try {
      final Response response = await post(
        Uri.parse(url),
        body: jsonEncode(body),
        headers: {'content-type': "Application/json"},
      );
      log(response.statusCode.toString());
      log(response.body.toString());
      if (response.statusCode == 200) {
        final decodeResponse = jsonDecode(response.body);
        return ResponseObject(
            statusCode: 200, responsBody: decodeResponse, isSuccess: true);
      } else if (response.statusCode == 401) {
        return ResponseObject(
          statusCode: response.statusCode,
          responsBody: "",
          isSuccess: false,
          errorMessage: "Email/Password Incorrect",
        );
      } else {
        return ResponseObject(
          statusCode: response.statusCode,
          responsBody: "",
          isSuccess: false,
        );
      }
    } catch (e) {
      log(e.toString());
      return ResponseObject(
          isSuccess: false,
          statusCode: -1,
          responsBody: "",
          errorMessage: e.toString());
    }
  }
}
