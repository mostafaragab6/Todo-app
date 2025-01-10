import 'package:freezed_annotation/freezed_annotation.dart';
part 'edit_task_request.g.dart';

@JsonSerializable()
class EditTaskRequest {
  String image;
  String title;
  String desc;
  String priority;
  String status;
  String user;

  EditTaskRequest({
    required this.desc,
    required this.image,
    required this.priority,
    required this.status,
    required this.title,
    required this.user,
  });

  Map<String, dynamic> toJson() => _$EditTaskRequestToJson(this);
}
