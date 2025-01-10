import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  String phone;
  String password;

  LoginRequest({
    required this.password,
    required this.phone,
  });

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
