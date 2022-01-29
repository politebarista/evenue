import 'package:evenue/common/ui/custom_text_field.dart';
import 'package:evenue/common/ui/evenue_button.dart';
import 'package:evenue/modules/login/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({Key? key}) : super(key: key);

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
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
    return BlocProvider(
      create: (_) => LoginBloc(),
      child: BlocConsumer<LoginBloc, LoginState>(
        buildWhen: (_, current) =>
            current is LoginPendingState || current is LoginInitialState,
        listenWhen: (_, current) =>
            current is LoginSuccessState || current is LoginFailureState,
        builder: (context, state) {
          return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                CustomTextField(controller: _emailTextController),
                SizedBox(height: 8),
                CustomTextField(controller: _passwordTextController),
                SizedBox(height: 8),
                EvenueButton(
                  onTap: () => context.read<LoginBloc>().add(
                        LoginUserEvent(
                          _emailTextController.text,
                          _passwordTextController.text,
                        ),
                      ),
                  text: 'kakdela',
                ),
              ],
            ),
          );
        },
        listener: (context, state) {
          if (state is LoginSuccessState) {
            print('u in');
          } else if (state is LoginFailureState) {
            print('failure');
          } else {
            throw UnimplementedError();
          }
        },
      ),
    );
  }
}
