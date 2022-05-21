part of 'customer_registration_bloc.dart';

@immutable
class CustomerRegistrationEvent {
  final String lastName, firstName, email, phoneNumber, password;

  CustomerRegistrationEvent(
    this.lastName,
    this.firstName,
    this.email,
    this.phoneNumber,
    this.password,
  );
}
