import 'package:bloc/bloc.dart';
import 'package:evenue/features/user_profile/user_profile_bloc.dart';
import 'package:evenue/repositories/user_repository.dart';
import 'package:meta/meta.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository _userRepository;
  final UserProfileBloc _userProfileBloc;

  LoginBloc(UserRepository userRepository, UserProfileBloc userProfileBloc)
      : this._userRepository = userRepository,
        this._userProfileBloc = userProfileBloc,
        super(LoginInitialState()) {
    on<LoginUserEvent>(_loginUserHandler);
  }

  void _loginUserHandler(LoginUserEvent event, Emitter<LoginState> emit) async {
    final isUserLoggedIn = await _userRepository.login(
      event.email,
      event.password,
    );
    if (isUserLoggedIn) {
      _userProfileBloc.add(CheckAuthorizationUserProfileEvent());
    } else {
      emit(LoginFailureState());
    }
  }
}
