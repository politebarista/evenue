import 'package:bloc/bloc.dart';
import 'package:evenue/repositories/user_repository.dart';
import 'package:meta/meta.dart';

part 'user_profile_event.dart';

part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final UserRepository _userRepository;

  UserProfileBloc(this._userRepository) : super(PendingUserProfileState()) {
    on<CheckAuthorizationUserProfileEvent>(_checkAuthorization);
    on<LogOutUserProfileEvent>(_logout);
  }

  _checkAuthorization(
    CheckAuthorizationUserProfileEvent _,
    Emitter<UserProfileState> emit,
  ) {
    emit(
      _userRepository.isUserAuthorized
          ? AuthorizedUserProfileState()
          : NotAuthorizedUserProfileState(),
    );
  }

  _logout(LogOutUserProfileEvent _, Emitter<UserProfileState> __) {
    _userRepository.logout();
    add(CheckAuthorizationUserProfileEvent());
  }
}
