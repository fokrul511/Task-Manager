import 'package:get/get.dart';
import 'package:task_manager/data/models/count_by_status_warpper.dart';
import 'package:task_manager/data/service/network_caller.dart';
import 'package:task_manager/data/utility/urls.dart';

class CountTaskByStatusController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;
  CountByStatusWarpper? _countByStatusWarpper = CountByStatusWarpper();

  bool get inProgress => _inProgress;

  CountByStatusWarpper? get countByStatusWarpper => _countByStatusWarpper;

  String get errorMessage =>
      _errorMessage ?? "Fetch count by task status faild";

  Future<bool> getCountByTaskStatus() async {
    bool isSuccess = false;
    _inProgress = true;
    update();
    final response = await NetworkCaller.getRequest(Urls.taskcountBystatus);

    if (response.isSuccess) {
      _countByStatusWarpper =
          CountByStatusWarpper.fromJson(response.responsBody);
      isSuccess = true;
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
