part of 'user_profile_bloc.dart';

@immutable
abstract class UserProfileState {}

class AuthorizedUserProfileState extends UserProfileState {}

class NotAuthorizedUserProfileState extends UserProfileState {}
