import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task_manager/data/models/task_by_status_data.dart';
import 'package:task_manager/data/models/task_list_wrapper.dart';
import 'package:task_manager/data/service/network_caller.dart';
import 'package:task_manager/data/utility/urls.dart';
import 'package:task_manager/presentation/controllers/count_task_by_status_controller.dart';
import 'package:task_manager/presentation/screens/add_new_task.dart';
import 'package:task_manager/presentation/widgets/background_widget.dart';
import 'package:task_manager/presentation/widgets/empty_list_widget.dart';
import 'package:task_manager/presentation/widgets/profile_app_bar.dart';
import 'package:task_manager/presentation/widgets/snack_bar_message.dart';
import 'package:task_manager/presentation/widgets/task_card.dart';
import 'package:task_manager/presentation/widgets/task_counter_card.dart';

class NewTaskScreen extends StatefulWidget {
  const NewTaskScreen({super.key});

  @override
  State<NewTaskScreen> createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  TaskListWrapper _newTaskListWrapper = TaskListWrapper();
  bool newTaskListInProgress = false;
  bool deleaTaskListInProgress = false;
  bool updateTaskSatusListInProgress = false;

  @override
  void initState() {
    super.initState();
    getDataFormApi();
  }

  void getDataFormApi() {
    Get.find<CountTaskByStatusController>().getCountByTaskStatus();
    _getAllNewTaskList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar,
      body: BackgroundWidget(
        child: Column(
          children: [
            GetBuilder<CountTaskByStatusController>(
                builder: (countTaskByStatusController) {
              return Visibility(
                visible: countTaskByStatusController.inProgress == false,
                replacement: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: LinearProgressIndicator(),
                ),
                child: taskCounterSection(
                  countTaskByStatusController
                          .countByStatusWarpper?.listOfTaskbyStatusData ??
                      [],
                ),
              );
            }),
            Expanded(
              child: Visibility(
                visible: newTaskListInProgress == false,
                replacement: const Center(child: CircularProgressIndicator()),
                child: RefreshIndicator(
                  onRefresh: () async => getDataFormApi(),
                  child: Visibility(
                    visible: _newTaskListWrapper.taskList?.isNotEmpty ?? false,
                    replacement: const EmptyListWidget(),
                    child: ListView.builder(
                      itemCount: _newTaskListWrapper.taskList?.length ?? 0,
                      itemBuilder: (context, index) {
                        return TaskCard(
                          taskItem: _newTaskListWrapper.taskList![index],
                          refreshList: () {
                            getDataFormApi();
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          //Todo: refress full apps ,add new any thing.
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNewTaskScreen(),
            ),
          );
          if (result != null && result == true) {
            getDataFormApi();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget taskCounterSection(
      List<TaskCountByStatusData> listOfTaskCountByStatus) {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: listOfTaskCountByStatus.length,
        itemBuilder: (context, index) {
          return NewTaskCard(
            amount: listOfTaskCountByStatus[index].sum ?? 0,
            title: listOfTaskCountByStatus[index].sId ?? '',
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }

  // Future<void> _getAllTaskCountByStatus() async {
  //   getAllTaskCountByStatusInprogress = true;
  //   setState(() {});
  //   final response = await NetworkCaller.getRequest(Urls.taskcountBystatus);
  //
  //   if (response.isSuccess) {
  //     _countByStatusWarpper =
  //         CountByStatusWarpper.fromJson(response.responsBody);
  //     getAllTaskCountByStatusInprogress = false;
  //     setState(() {});
  //   } else {
  //     getAllTaskCountByStatusInprogress = false;
  //     setState(() {});
  //     if (mounted) {
  //       snackbarMessage(context,
  //           response.errorMessage ?? 'Get task count by status has been faild');
  //     }
  //   }
  // }

  Future<void> _getAllNewTaskList() async {
    newTaskListInProgress = true;
    setState(() {});
    final response = await NetworkCaller.getRequest(Urls.newTaskList);
    if (response.isSuccess) {
      _newTaskListWrapper = TaskListWrapper.fromJson(response.responsBody);
      newTaskListInProgress = false;
      setState(() {});
    } else {
      newTaskListInProgress = false;
      setState(() {});
      if (mounted) {
        snackbarMessage(context,
            response.errorMessage ?? 'Get new task List has been faild');
      }
    }
  }
}
