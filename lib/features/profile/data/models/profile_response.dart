import 'package:freezed_annotation/freezed_annotation.dart';
part 'profile_response.g.dart';

@JsonSerializable()
class ProfileResponse {
  @JsonKey(name: '_id')
  String? id;
  String? displayName;
  @JsonKey(name: 'username')
  String? userName;
  int? experienceYears;
  String? address;
  String? level;

  ProfileResponse(
    this.address,
    this.displayName,
    this.experienceYears,
    this.id,
    this.level,
    this.userName,
  );

  factory ProfileResponse.fromJson(Map<String, dynamic> json) =>
      _$ProfileResponseFromJson(json);
}
