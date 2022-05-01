part of 'user_profile_bloc.dart';

@immutable
abstract class UserProfileEvent {}

class CheckAuthorizationUserProfileEvent extends UserProfileEvent {}

class LogOutUserProfileEvent extends UserProfileEvent {}
