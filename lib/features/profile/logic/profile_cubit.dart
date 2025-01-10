import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/features/profile/data/repos/profile_repo.dart';
import 'package:todo_app/features/profile/logic/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo _profileRepo;
  ProfileCubit(this._profileRepo) : super(ProfileState.initial());

  void getProfile() async {
    emit(ProfileState.loading());

    final response = await _profileRepo.getProfile();

    response.when(
      success: (response) {
        print(response.displayName);
        emit(ProfileState.success(response));
      },
      failure: (error) {
        emit(ProfileState.error(error));
      },
    );
  }
}
