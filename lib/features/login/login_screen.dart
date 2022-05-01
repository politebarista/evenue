import 'package:evenue/common/ui/custom_text_field.dart';
import 'package:evenue/common/ui/evenue_button.dart';
import 'package:evenue/features/login/login_bloc.dart';
import 'package:evenue/features/user_profile/user_profile_bloc.dart';
import 'package:evenue/stores/repositories_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
        create: (_) => LoginBloc(
          context.read<RepositoriesStore>().userRepository,
          context.read<UserProfileBloc>(),
        ),
        child: BlocConsumer<LoginBloc, LoginState>(
          buildWhen: (_, current) =>
              current is LoginPendingState || current is LoginInitialState,
          listenWhen: (_, current) => current is LoginFailureState,
          builder: (context, state) {
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
                    onTap: () => context.read<LoginBloc>().add(
                          LoginUserEvent(
                            _emailTextController.text,
                            _passwordTextController.text,
                          ),
                        ),
                    text: 'Login',
                  ),
                ],
              ),
            );
          },
          listener: (context, state) {
            if (state is LoginFailureState) {
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
