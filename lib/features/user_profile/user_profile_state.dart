part of 'user_profile_bloc.dart';

@immutable
abstract class UserProfileState {}

class PendingUserProfileState extends UserProfileState {}

class AuthorizedCustomerProfileState extends UserProfileState {
  final Customer customer;

  AuthorizedCustomerProfileState(this.customer);
}

class AuthorizedOrganizerProfileState extends UserProfileState {
  final Organizer organizer;

  AuthorizedOrganizerProfileState(this.organizer);
}

class NotAuthorizedUserProfileState extends UserProfileState {}
