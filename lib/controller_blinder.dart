import 'package:get/get.dart';
import 'package:task_manager/presentation/controllers/sing_in_controller.dart';

class ControllerBlinder extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SinInController());
  }

}
