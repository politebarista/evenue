import 'package:bloc/bloc.dart';
import 'package:evenue/models/customer.dart';
import 'package:evenue/repositories/customer_repository.dart';
import 'package:evenue/stores/user_store.dart';
import 'package:meta/meta.dart';

part 'user_profile_event.dart';

part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final UserStore _userStore;
  final CustomerRepository _customerRepository;

  UserProfileBloc(
    this._userStore,
    this._customerRepository,
  ) : super(PendingUserProfileState()) {
    on<CheckAuthorizationUserProfileEvent>(_checkAuthorization);
    on<LogOutUserProfileEvent>(_logout);
  }

  _checkAuthorization(
    CheckAuthorizationUserProfileEvent _,
    Emitter<UserProfileState> emit,
  ) {
    emit(
      // separate the states of an authorized client and an authorized organizer
      _userStore.customer != null
          ? AuthorizedUserProfileState(_userStore.customer!)
          : NotAuthorizedUserProfileState(),
    );
  }

  _logout(LogOutUserProfileEvent _, Emitter<UserProfileState> __) async {
    await _customerRepository.logout();
    add(CheckAuthorizationUserProfileEvent());
  }
}
