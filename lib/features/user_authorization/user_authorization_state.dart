part of 'user_authorization_bloc.dart';

@immutable
abstract class UserAuthorizationState {}

class CustomerUserAuthorizationState extends UserAuthorizationState {}

class OrganizerUserAuthorizationState extends UserAuthorizationState {}
