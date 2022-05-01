import 'package:bloc/bloc.dart';
import 'package:evenue/repositories/customer_repository.dart';
import 'package:meta/meta.dart';

part 'user_profile_event.dart';

part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final CustomerRepository _customerRepository;

  UserProfileBloc(this._customerRepository) : super(PendingUserProfileState()) {
    on<CheckAuthorizationUserProfileEvent>(_checkAuthorization);
    on<LogOutUserProfileEvent>(_logout);
  }

  _checkAuthorization(
    CheckAuthorizationUserProfileEvent _,
    Emitter<UserProfileState> emit,
  ) {
    emit(
      // separate the states of an authorized client and an authorized organizer
      _customerRepository.isCustomerAuthorized
          ? AuthorizedUserProfileState()
          : NotAuthorizedUserProfileState(),
    );
  }

  _logout(LogOutUserProfileEvent _, Emitter<UserProfileState> __) async {
    await _customerRepository.logout();
    add(CheckAuthorizationUserProfileEvent());
  }
}
