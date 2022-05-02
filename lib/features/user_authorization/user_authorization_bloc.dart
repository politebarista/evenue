import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'user_authorization_event.dart';

part 'user_authorization_state.dart';

class UserAuthorizationBloc
    extends Bloc<UserAuthorizationEvent, UserAuthorizationState> {
  UserAuthorizationBloc() : super(CustomerUserAuthorizationState()) {
    on<ChangeUserAuthorizationMethodEvent>(_changeAuthorizationMethod);
  }

  _changeAuthorizationMethod(
    ChangeUserAuthorizationMethodEvent event,
    Emitter<UserAuthorizationState> emit,
  ) {
    emit(
      event.isAuthorizingClient
          ? CustomerUserAuthorizationState()
          : OrganizerUserAuthorizationState(),
    );
  }
}
