import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:todo_app/features/signup/ui/widgets/signup_form.dart';

import '../../../core/routing/routes.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../logic/signup_cubit.dart';
import 'widgets/signup_bloc_listener.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

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
                'assets/imgs/Frame 4 (1).png',
              ),
              Positioned(
                top: 250.h,
                left: 21.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Sign Up',
                      style: TextStyles.font24BlackWeight700(),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    SignupForm(),
                    SizedBox(
                      height: 20.h,
                    ),
                    AppTextButton(
                      onPressed: () {
                        if (context
                            .read<SignupCubit>()
                            .formKey
                            .currentState!
                            .validate()) {
                          context.read<SignupCubit>().signup();
                        }
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyles.font16WhiteWeight700(),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.only(start: 50.0.w),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: 'Already have an account? ',
                              style: TextStyles.font14LightGreyWeight400(),
                            ),
                            TextSpan(
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.pushNamedAndRemoveUntil(
                                    context,
                                    Routes.loginScreen,
                                    (Route<dynamic> route) => false,
                                  );
                                },
                              text: 'Sign In',
                              style: TextStyles.font14PurpleWeight400(),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SignupBlocListener()
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
