part of 'user_profile_bloc.dart';

@immutable
abstract class UserProfileState {}

class PendingUserProfileState extends UserProfileState {}

class AuthorizedUserProfileState extends UserProfileState {
  final Customer customer;

  AuthorizedUserProfileState(this.customer);
}

class NotAuthorizedUserProfileState extends UserProfileState {}
