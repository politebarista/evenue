part of 'user_profile_bloc.dart';

@immutable
abstract class UserProfileState {}

class PendingUserProfileState extends UserProfileState {}

class AuthorizedUserProfileState extends UserProfileState {}

class NotAuthorizedUserProfileState extends UserProfileState {}
