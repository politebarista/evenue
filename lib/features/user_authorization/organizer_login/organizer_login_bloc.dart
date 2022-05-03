import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:evenue/features/user_profile/user_profile_bloc.dart';
import 'package:evenue/repositories/organizer_repository.dart';
import 'package:meta/meta.dart';

part 'organizer_login_event.dart';

part 'organizer_login_state.dart';

class OrganizerLoginBloc
    extends Bloc<OrganizerLoginEvent, OrganizerLoginState> {
  final OrganizerRepository _organizerRepository;
  final UserProfileBloc _userProfileBloc;

  OrganizerLoginBloc(
    this._organizerRepository,
    this._userProfileBloc,
  ) : super(OrganizerLoginInitialState()) {
    on<LoginOrganizerEvent>(_login);
  }

  void _login(
    LoginOrganizerEvent event,
    Emitter<OrganizerLoginState> emit,
  ) async {
    emit(OrganizerLoginPendingState());

    final isLoginSuccessful = await _organizerRepository.login(
      event.contactPersonEmail,
      event.password,
    );

    if (isLoginSuccessful) {
      _userProfileBloc.add(CheckAuthorizationUserProfileEvent());
    } else {
      emit(OrganizerLoginFailureState());
    }
  }
}
