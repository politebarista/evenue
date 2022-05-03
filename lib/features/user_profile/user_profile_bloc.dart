import 'package:bloc/bloc.dart';
import 'package:evenue/models/customer.dart';
import 'package:evenue/models/organizer.dart';
import 'package:evenue/models/user.dart';
import 'package:evenue/repositories/customer_repository.dart';
import 'package:evenue/repositories/organizer_repository.dart';
import 'package:evenue/stores/user_store.dart';
import 'package:meta/meta.dart';

part 'user_profile_event.dart';

part 'user_profile_state.dart';

class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  final UserStore _userStore;
  final CustomerRepository _customerRepository;
  final OrganizerRepository _organizerRepository;

  UserProfileBloc(
    this._userStore,
    this._customerRepository,
    this._organizerRepository,
  ) : super(PendingUserProfileState()) {
    on<CheckAuthorizationUserProfileEvent>(_checkAuthorization);
    on<LogOutUserProfileEvent>(_logout);
  }

  _checkAuthorization(
    CheckAuthorizationUserProfileEvent _,
    Emitter<UserProfileState> emit,
  ) {
    final User? currentUser = _userStore.user;

    if (currentUser == null) {
      emit(NotAuthorizedUserProfileState());
      return;
    }

    late final state;
    if (currentUser is Customer) {
      state = AuthorizedCustomerProfileState(currentUser);
    } else if (currentUser is Organizer) {
      state = AuthorizedOrganizerProfileState(currentUser);
    } else {
      throw UnimplementedError();
    }

    emit(state);
  }

  _logout(LogOutUserProfileEvent _, Emitter<UserProfileState> emit) async {
    emit(PendingUserProfileState());

    // TODO: make something more elegant instead of the following two lines
    await _customerRepository.logout();
    await _organizerRepository.logout();

    add(CheckAuthorizationUserProfileEvent());
  }
}
