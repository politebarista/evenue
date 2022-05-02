part of 'user_authorization_bloc.dart';

@immutable
abstract class UserAuthorizationEvent {}

class ChangeUserAuthorizationMethodEvent extends UserAuthorizationEvent {
  final bool isAuthorizingClient;

  ChangeUserAuthorizationMethodEvent(this.isAuthorizingClient);
}
