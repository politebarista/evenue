part of 'organizer_login_bloc.dart';

@immutable
abstract class OrganizerLoginEvent {}

class LoginOrganizerEvent extends OrganizerLoginEvent {
  final String contactPersonEmail, password;

  LoginOrganizerEvent(this.contactPersonEmail, this.password);
}
