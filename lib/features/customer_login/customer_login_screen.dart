import 'package:evenue/common/ui/custom_text_field.dart';
import 'package:evenue/common/ui/evenue_button.dart';
import 'package:evenue/common/ui/pending_widget.dart';
import 'package:evenue/features/customer_login/customer_login_bloc.dart';
import 'package:evenue/features/user_profile/user_profile_bloc.dart';
import 'package:evenue/stores/repositories_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class CustomerLoginScreen extends StatefulWidget {
  const CustomerLoginScreen({Key? key}) : super(key: key);

  @override
  State<CustomerLoginScreen> createState() => _CustomerLoginScreenState();
}

class _CustomerLoginScreenState extends State<CustomerLoginScreen> {
  late final TextEditingController _emailTextController;
  late final TextEditingController _passwordTextController;

  @override
  void initState() {
    _emailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    super.initState();
  }

  // TODO add validation
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (_) => CustomerLoginBloc(
          context.read<RepositoriesStore>().customerRepository,
          context.read<UserProfileBloc>(),
        ),
        child: BlocConsumer<CustomerLoginBloc, CustomerLoginState>(
          buildWhen: (_, current) =>
              current is CustomerLoginPendingState ||
              current is CustomerLoginInitialState,
          listenWhen: (_, current) => current is CustomerLoginFailureState,
          builder: (context, state) {
            if (state is CustomerLoginPendingState) {
              return LayoutBuilder(builder: (context, constraints) {
                return SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: Center(child: PendingWidget()),
                );
              });
            } else if (state is CustomerLoginInitialState) {
              return Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text('authorization'),
                    const SizedBox(height: 8),
                    CustomTextField(controller: _emailTextController),
                    const SizedBox(height: 8),
                    CustomTextField(controller: _passwordTextController),
                    const SizedBox(height: 8),
                    EvenueButton(
                      onTap: () => context.read<CustomerLoginBloc>().add(
                            LoginCustomerEvent(
                              _emailTextController.text,
                              _passwordTextController.text,
                            ),
                          ),
                      text: 'Login',
                    ),
                  ],
                ),
              );
            } else {
              throw UnimplementedError();
            }
          },
          listener: (context, state) {
            if (state is CustomerLoginFailureState) {
              print('failure');
            } else {
              throw UnimplementedError();
            }
          },
        ),
      ),
    );
  }
}
