import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/routing/routes.dart';
import 'package:todo_app/features/login/logic/login_cubit.dart';
import 'package:todo_app/features/login/logic/login_state.dart';

import '../../../../core/theming/colors_manager.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(loading: () {
          showDialog(
            context: context,
            builder: (context) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainPurpule,
              ),
            ),
          );
        }, success: (data) {
          Navigator.pop(context);

          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.homeScreen,
            (Route<dynamic> route) => false,
          );
        }, error: (error) {
          Navigator.pop(context);

          if (error.contains('status code of 401')) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Phone number or password not correct'),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              ),
            );
          } else {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error happened'),
                backgroundColor: Colors.red,
                duration: Duration(seconds: 3),
              ),
            );
          }
        });
      },
      child: SizedBox.shrink(),
    );
  }
}
