import 'package:freezed_annotation/freezed_annotation.dart';
part 'create_task_request.g.dart';

@JsonSerializable()
class CreateTaskRequest {
  String image;
  String title;
  String desc;
  String priority;
  String dueDate;

  CreateTaskRequest({
    required this.desc,
    required this.dueDate,
    required this.image,
    required this.priority,
    required this.title,
  });

  Map<String, dynamic> toJson() => _$CreateTaskRequestToJson(this);
}
