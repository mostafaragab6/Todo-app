import 'package:freezed_annotation/freezed_annotation.dart';
part 'signup_request.g.dart';

@JsonSerializable()
class SignupRequest {
  String displayName;
  String phone;
  String password;
  int experienceYears;
  String address;
  String level;

  SignupRequest({
    required this.address,
    required this.displayName,
    required this.experienceYears,
    required this.level,
    required this.password,
    required this.phone,
  });

  Map<String, dynamic> toJson() => _$SignupRequestToJson(this);
}
