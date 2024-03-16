import 'package:task_manager/data/models/task_by_status_data.dart';

class Countbystatuswarpper {
  String? status;
  List<taskByStatusData>? data;

  Countbystatuswarpper({this.status, this.data});

  Countbystatuswarpper.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <taskByStatusData>[];
      json['data'].forEach((v) {
        data!.add(taskByStatusData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}


