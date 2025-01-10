// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProfileResponse _$ProfileResponseFromJson(Map<String, dynamic> json) =>
    ProfileResponse(
      json['address'] as String?,
      json['displayName'] as String?,
      (json['experienceYears'] as num?)?.toInt(),
      json['_id'] as String?,
      json['level'] as String?,
      json['username'] as String?,
    );

Map<String, dynamic> _$ProfileResponseToJson(ProfileResponse instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'displayName': instance.displayName,
      'username': instance.userName,
      'experienceYears': instance.experienceYears,
      'address': instance.address,
      'level': instance.level,
    };
