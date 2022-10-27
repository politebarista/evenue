import 'package:evenue/common/email_helper.dart';
import 'package:evenue/common/password_helper.dart';
import 'package:evenue/common/ui/custom_text_field.dart';
import 'package:evenue/common/ui/evenue_button.dart';
import 'package:evenue/common/ui/pending_widget.dart';
import 'package:evenue/features/customer_registration/customer_registration_widget.dart';
import 'package:evenue/features/user_authorization/customer_login/customer_login_bloc.dart';
import 'package:evenue/features/user_authorization/user_authorization_bloc.dart';
import 'package:evenue/features/user_profile/user_profile_bloc.dart';
import 'package:evenue/stores/repositories_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

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
    return Scaffold(
      appBar: AppBar(title: Text('Авторизация - Клиент')),
      body: BlocProvider(
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
              return SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _emailTextController,
                        label: 'Email',
                      ),
                      const SizedBox(height: 8),
                      // TODO: hide password with dots
                      CustomTextField(
                        obscureText: true,
                        controller: _passwordTextController,
                        label: 'Пароль',
                      ),
                      const SizedBox(height: 8),
                      EvenueButton(
                        onTap: () => _login(context),
                        text: 'Войти',
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () =>
                            context.read<UserAuthorizationBloc>().add(
                                  ChangeUserAuthorizationMethodEvent(false),
                                ),
                        child: Text('Я организатор'),
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => CustomerRegistrationWidget(),
                          ),
                        ),
                        child: Text('Зарегистрироваться'),
                      ),
                    ],
                  ),
                ),
              );
            } else {
              throw UnimplementedError();
            }
          },
          listener: (context, state) {
            if (state is CustomerLoginFailureState) {
              _showDialog(
                context,
                'Ошибка при авторизации клиента',
                'Возможно этот клиента не зарегистрирован',
              );
            } else {
              throw UnimplementedError();
            }
          },
        ),
      ),
    );
  }

  void _login(final BuildContext context) {
    if (!EmailHelper.isEmailValid(_emailTextController.text)) {
      _showDialog(context, 'Email введен неверно');
      return;
    }

    if (!PasswordHelper.isPasswordValid(_passwordTextController.text)) {
      _showDialog(context, 'Пароль должен содержать не менее 5 символов');
      return;
    }

    context.read<CustomerLoginBloc>().add(
          LoginCustomerEvent(
            _emailTextController.text,
            _passwordTextController.text,
          ),
        );
  }

  void _showDialog(
    final BuildContext context,
    final String title, [
    final String? content,
  ]) =>
      showPlatformDialog(
        context: context,
        builder: (_) => BasicDialogAlert(
          title: Text(
            title,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          content: content == null
              ? null
              : Text(
                  content,
                  style: TextStyle(color: Colors.black),
                ),
          actions: [
            BasicDialogAction(
              title: Text("Ок"),
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
            ),
          ],
        ),
      );
}
