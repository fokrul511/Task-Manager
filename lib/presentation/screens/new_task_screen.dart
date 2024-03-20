import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task_manager/data/models/count_by_status_warpper.dart';
import 'package:task_manager/data/service/network_caller.dart';
import 'package:task_manager/data/utility/urls.dart';
import 'package:task_manager/presentation/screens/add_new_task.dart';
import 'package:task_manager/presentation/widgets/background_widget.dart';
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
  bool getAllTaskCountByStatusInprogress = false;
  CountByStatusWarpper? _countByStatusWarpper = CountByStatusWarpper();

  @override
  void initState() {
    super.initState();
    _getAllTaskCountByStatus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: profileAppBar,
      body: BackgroundWidget(
        child: Column(
          children: [
            Visibility(
              visible: getAllTaskCountByStatusInprogress == false,
              replacement: const Padding(
                padding: EdgeInsets.all(8.0),
                child: LinearProgressIndicator(),
              ),
              child: taskCounterSection,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const TaskCard();
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddNewTaskScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget get taskCounterSection {
    return SizedBox(
      height: 110,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: _countByStatusWarpper!.listOfTaskbyStatusData?.length ?? 0,
        itemBuilder: (context, index) {
          return NewTaskCard(
            amount:
                _countByStatusWarpper?.listOfTaskbyStatusData![index].sum ?? 0,
            title:
                _countByStatusWarpper?.listOfTaskbyStatusData![index].sId ?? '',
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

  Future<void> _getAllTaskCountByStatus() async {
    getAllTaskCountByStatusInprogress = true;
    setState(() {});
    final response = await NetworkCaller.getRequest(Urls.taskcountBystatus);

    if (response.isSuccess) {
      _countByStatusWarpper =
          CountByStatusWarpper.fromJson(response.responsBody);
      getAllTaskCountByStatusInprogress = false;
      setState(() {});
    } else {
      if (mounted) {
        getAllTaskCountByStatusInprogress = false;
        setState(() {});
        snackbarMessage(context,
            response.errorMessage ?? 'Get task count by status has been faild');
      }
    }
  }
}
