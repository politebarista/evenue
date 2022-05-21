part of 'customer_registration_bloc.dart';

@immutable
abstract class CustomerRegistrationState {}

class CustomerRegistrationInitState extends CustomerRegistrationState {}

class CustomerRegistrationSuccessState extends CustomerRegistrationState {}

class CustomerRegistrationFailureState extends CustomerRegistrationState {}

class CustomerRegistrationPendingState extends CustomerRegistrationState {}
