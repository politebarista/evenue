part of 'organizer_login_bloc.dart';

@immutable
abstract class OrganizerLoginState {}

class OrganizerLoginInitialState extends OrganizerLoginState {}

class OrganizerLoginPendingState extends OrganizerLoginState {}

class OrganizerLoginFailureState extends OrganizerLoginState {}
