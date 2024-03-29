import 'package:get/get.dart';
import 'package:task_manager/presentation/controllers/count_task_by_status_controller.dart';
import 'package:task_manager/presentation/controllers/sing_in_controller.dart';

class ControllerBlinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SinInController());
    Get.lazyPut(() => CountTaskByStatusController());
  }

}
