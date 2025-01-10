import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/login/logic/login_cubit.dart';
import 'package:todo_app/features/login/ui/widgets/login_form.dart';

import '../../../core/routing/routes.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import 'widgets/login_bloc_listener.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  var phoneController = TextEditingController();
  var passController = TextEditingController();

  var formKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: double.infinity,
          height: MediaQuery.sizeOf(context).height,
          child: Stack(
            children: [
              Image.asset(
                'assets/imgs/Frame 4.png',
              ),
              Positioned(
                top: 480.h,
                left: 21.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: TextStyles.font24BlackWeight700(),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    LoginForm(),
                    SizedBox(
                      height: 20.h,
                    ),
                    AppTextButton(
                      onPressed: () {
                        if (context
                            .read<LoginCubit>()
                            .formKey
                            .currentState!
                            .validate()) {
                          context.read<LoginCubit>().login();
                        }
                      },
                      child: Text(
                        'Sign In',
                        style: TextStyles.font16WhiteWeight700(),
                      ),
                    ),
                    LoginBlocListener(),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 50.0.w),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Didn’t have any account? ',
                              style: TextStyles.font14LightGreyWeight400(),
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamed(
                                    context,
                                    Routes.signupScreen,
                                  );
                                },
                              text: 'Sign Up here',
                              style: TextStyles.font14PurpleWeight400(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
