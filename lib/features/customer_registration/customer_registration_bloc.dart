import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:evenue/repositories/customer_repository.dart';
import 'package:meta/meta.dart';

part 'customer_registration_event.dart';

part 'customer_registration_state.dart';

class CustomerRegistrationBloc
    extends Bloc<CustomerRegistrationEvent, CustomerRegistrationState> {
  final CustomerRepository _customerRepository;

  CustomerRegistrationBloc(
    this._customerRepository,
  ) : super(CustomerRegistrationInitState()) {
    on<CustomerRegistrationEvent>(_register);
  }

  _register(
    CustomerRegistrationEvent event,
    Emitter<CustomerRegistrationState> emit,
  ) async {
    emit(CustomerRegistrationPendingState());

    final isRegistrationSuccessful = await _customerRepository.register(
      event.lastName,
      event.firstName,
      event.email,
      event.phoneNumber,
      event.password,
    );

    if (isRegistrationSuccessful) {
      emit(CustomerRegistrationSuccessState());
      return;
    }

    emit(CustomerRegistrationFailureState());
    emit(CustomerRegistrationInitState());
  }
}
