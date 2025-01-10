import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/helpers/shared_pref_helpers.dart';
import 'package:todo_app/core/networking/dio_factory.dart';
import 'package:todo_app/features/login/data/models/login_request.dart';
import 'package:todo_app/features/login/data/repos/login_repo.dart';
import 'package:todo_app/features/login/logic/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo _loginRepo;
  LoginCubit(this._loginRepo) : super(const LoginState.initial());

  TextEditingController phoneController = TextEditingController();
  TextEditingController passController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  void login() async {
    emit(LoginState.loading());
    final response = await _loginRepo.login(LoginRequest(
      password: passController.text,
      phone: '+20${phoneController.text}',
    ));

    response.when(
      success: (data) {
        DioFactory.setTokenIntoHeaderAfterLogin(data.accessToken!);
        SharedPrefHelper.setSecuredString('access_token', data.accessToken!);
        SharedPrefHelper.setSecuredString('refresh_token', data.refreshToken!);

        emit(LoginState.success(data));
      },
      failure: (error) {
        emit(LoginState.error(error));
      },
    );
  }
}
