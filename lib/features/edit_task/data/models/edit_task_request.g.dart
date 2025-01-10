// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_task_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EditTaskRequest _$EditTaskRequestFromJson(Map<String, dynamic> json) =>
    EditTaskRequest(
      desc: json['desc'] as String,
      image: json['image'] as String,
      priority: json['priority'] as String,
      status: json['status'] as String,
      title: json['title'] as String,
      user: json['user'] as String,
    );

Map<String, dynamic> _$EditTaskRequestToJson(EditTaskRequest instance) =>
    <String, dynamic>{
      'image': instance.image,
      'title': instance.title,
      'desc': instance.desc,
      'priority': instance.priority,
      'status': instance.status,
      'user': instance.user,
    };
