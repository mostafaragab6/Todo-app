import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/core/networking/dio_factory.dart';
import 'package:todo_app/core/theming/colors_manager.dart';
import 'package:todo_app/features/profile/logic/profile_cubit.dart';
import 'package:todo_app/features/profile/logic/profile_state.dart';

import 'profile_data.dart';

class ProfileBlocBuilder extends StatelessWidget {
  const ProfileBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      buildWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      builder: (context, state) {
        return state.maybeWhen(
          loading: () {
            return Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainPurpule,
              ),
            );
          },
          success: (data) {
            return ProfileData(
              data: data,
            );
          },
          error: (error) {
            if (error.contains('status code of 401')) {
              DioFactory.refreshToken();
              context.read<ProfileCubit>().getProfile();
            }
            return SizedBox.shrink();
          },
          orElse: () {
            return SizedBox.shrink();
          },
        );
      },
    );
  }
}
