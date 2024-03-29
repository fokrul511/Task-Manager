import 'package:get/get.dart';
import 'package:task_manager/data/models/login_response.dart';
import 'package:task_manager/data/models/response_object.dart';
import 'package:task_manager/data/service/network_caller.dart';
import 'package:task_manager/data/utility/urls.dart';
import 'package:task_manager/presentation/controllers/auth_controller.dart';

class SinInController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage ?? "Login Faild! Try again";

  Future<bool> singIn(String email, String password) async {
    _inProgress = true;
    update();
    Map<String, dynamic> inputPrams = {
      "email": email,
      "password": password,
    };

    final ResponseObject response = await NetworkCaller.postRequest(
        Urls.login, inputPrams,
        fromsingIn: true);
    _inProgress = false;
    // update();

    if (response.isSuccess) {
      LoginResponse loginResponse =
          LoginResponse.fromJson(response.responsBody);
      //save cecsh data
      await AuthController.saveUserData(loginResponse.userdata!);
      await AuthController.saveUserToken(loginResponse.token!);
      update();
      return true;
    } else {
      _errorMessage = response.errorMessage;
      update();
      return false;
    }
  }
}
