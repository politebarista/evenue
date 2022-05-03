import 'package:bloc/bloc.dart';
import 'package:evenue/features/user_profile/user_profile_bloc.dart';
import 'package:evenue/repositories/customer_repository.dart';
import 'package:meta/meta.dart';

part 'customer_login_event.dart';

part 'customer_login_state.dart';

class CustomerLoginBloc extends Bloc<CustomerLoginEvent, CustomerLoginState> {
  final CustomerRepository _customerRepository;
  final UserProfileBloc _userProfileBloc;

  CustomerLoginBloc(
    CustomerRepository userRepository,
    UserProfileBloc userProfileBloc,
  )   : this._customerRepository = userRepository,
        this._userProfileBloc = userProfileBloc,
        super(CustomerLoginInitialState()) {
    on<LoginCustomerEvent>(_login);
  }

  void _login(
    LoginCustomerEvent event,
    Emitter<CustomerLoginState> emit,
  ) async {
    emit(CustomerLoginPendingState());

    final isLoginSuccessful = await _customerRepository.login(
      event.email,
      event.password,
    );

    if (isLoginSuccessful) {
      _userProfileBloc.add(CheckAuthorizationUserProfileEvent());
    } else {
      emit(CustomerLoginFailureState());
    }
  }
}
