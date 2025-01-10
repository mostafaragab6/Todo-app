import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/signup/data/repos/signup_repo.dart';
import 'package:todo_app/features/signup/data/models/signup_request.dart';
import 'package:todo_app/features/signup/logic/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignupRepo _signupRepo;
  SignupCubit(this._signupRepo) : super(SignupState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController yearExpLevelController = TextEditingController();
  TextEditingController expLevelController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void signup() async {
    emit(SignupState.loading());
    final response = await _signupRepo.signup(SignupRequest(
      address: addressController.text,
      displayName: nameController.text,
      experienceYears: int.parse(yearExpLevelController.text),
      level: expLevelController.text,
      password: passController.text,
      phone: '+20${phoneController.text}',
    ));

    response.when(
      success: (data) {
        print(data.displayName);
        emit(SignupState.success(data));
      },
      failure: (error) {
        print(error.toString());
        emit(SignupState.error(error));
      },
    );
  }
}
