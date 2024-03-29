import 'package:get/get.dart';
import 'package:task_manager/data/models/task_list_wrapper.dart';
import 'package:task_manager/data/service/network_caller.dart';
import 'package:task_manager/data/utility/urls.dart';

class NewTaskController extends GetxController {
  bool _inProgress = false;
  String? _errorMessage;
  TaskListWrapper _taskListWrapper = TaskListWrapper();

  bool get inProgress => _inProgress;

  String get errorMessage => _errorMessage ?? "";

  TaskListWrapper get taskListWrapper => _taskListWrapper;

  Future<bool> getNewTaskList() async {
    bool isSuccess = false;

    _inProgress = true;
    update();
    final response = await NetworkCaller.getRequest(Urls.newTaskList);

    if (response.isSuccess) {
      _taskListWrapper = TaskListWrapper.fromJson(response.responsBody);
    } else {
      _errorMessage = response.errorMessage;
    }
    _inProgress = false;
    update();
    return isSuccess;
  }
}
