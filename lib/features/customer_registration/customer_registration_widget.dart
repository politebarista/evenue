import 'package:evenue/common/email_helper.dart';
import 'package:evenue/common/password_helper.dart';
import 'package:evenue/common/phone_number_helper.dart';
import 'package:evenue/common/ui/custom_text_field.dart';
import 'package:evenue/common/ui/evenue_button.dart';
import 'package:evenue/common/ui/indent_widget.dart';
import 'package:evenue/common/ui/pending_widget.dart';
import 'package:evenue/features/customer_registration/customer_registration_bloc.dart';
import 'package:evenue/features/user_profile/user_profile_bloc.dart';
import 'package:evenue/features/user_profile/user_profile_widget.dart';
import 'package:evenue/stores/repositories_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

class CustomerRegistrationWidget extends StatefulWidget {
  const CustomerRegistrationWidget({Key? key}) : super(key: key);

  @override
  State<CustomerRegistrationWidget> createState() =>
      _CustomerRegistrationWidgetState();
}

class _CustomerRegistrationWidgetState
    extends State<CustomerRegistrationWidget> {
  late final TextEditingController _lastNameTextController;
  late final TextEditingController _firstNameTextController;
  late final TextEditingController _emailTextController;
  late final TextEditingController _phoneNumberTextController;
  late final TextEditingController _passwordTextController;

  @override
  void initState() {
    _lastNameTextController = TextEditingController();
    _firstNameTextController = TextEditingController();
    _emailTextController = TextEditingController();
    _phoneNumberTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    super.initState();
  }

  void _register(BuildContext context) {
    if (_lastNameTextController.text.trim().isEmpty) {
      _showDialog(context, 'Поле фамилии должно быть заполнено');
      return;
    }

    if (_firstNameTextController.text.trim().isEmpty) {
      _showDialog(context, 'Поле имени должно быть заполнено');
      return;
    }

    if (!EmailHelper.isEmailValid(_emailTextController.text)) {
      _showDialog(context, 'Email введен неверно');
      return;
    }

    if (!PhoneNumberHelper.isPhoneNumberValid(
      _phoneNumberTextController.text,
    )) {
      _showDialog(context, 'Номер телефона введен неверно');
      return;
    }

    if (!PasswordHelper.isPasswordValid(_passwordTextController.text)) {
      _showDialog(context, 'Пароль должен содержать не менее 5 символов');
      return;
    }

    context.read<CustomerRegistrationBloc>().add(
          CustomerRegistrationEvent(
            _lastNameTextController.text,
            _firstNameTextController.text,
            _emailTextController.text,
            _phoneNumberTextController.text,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Регистрация - клиент')),
      body: BlocProvider<CustomerRegistrationBloc>(
        create: (context) => CustomerRegistrationBloc(
          context.read<RepositoriesStore>().customerRepository,
        ),
        child:
            BlocConsumer<CustomerRegistrationBloc, CustomerRegistrationState>(
          buildWhen: (_, current) =>
              current is CustomerRegistrationPendingState ||
              current is CustomerRegistrationInitState,
          listenWhen: (_, current) =>
              current is CustomerRegistrationSuccessState ||
              current is CustomerRegistrationFailureState,
          builder: (context, state) {
            if (state is CustomerRegistrationPendingState) {
              return Center(child: PendingWidget());
            } else if (state is CustomerRegistrationInitState) {
              return SingleChildScrollView(
                child: IndentWidget(
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: _lastNameTextController,
                        label: 'Фамилия',
                      ),
                      const SizedBox(height: 8),
                      CustomTextField(
                        controller: _firstNameTextController,
                        label: 'Имя',
                      ),
                      const SizedBox(height: 8),
                      CustomTextField(
                        controller: _emailTextController,
                        label: 'Email',
                      ),
                      const SizedBox(height: 8),
                      CustomTextField(
                        controller: _phoneNumberTextController,
                        label: 'Номер телефона',
                      ),
                      const SizedBox(height: 8),
                      // TODO: hide password with dots
                      CustomTextField(
                        obscureText: true,
                        controller: _passwordTextController,
                        label: 'Пароль',
                      ),
                      const SizedBox(height: 8),
                      // TODO: add validation before sending
                      EvenueButton(
                        onTap: () => _register(context),
                        text: 'Зарегистрироваться',
                      ),
                      const SizedBox(height: 8),
                      TextButton(
                        onPressed: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(
                            builder: (context) => UserProfileWidget(),
                          ),
                        ),
                        child: Text('Авторизация'),
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
            if (state is CustomerRegistrationSuccessState) {
              context.read<UserProfileBloc>().add(
                    CheckAuthorizationUserProfileEvent(),
                  );
              Navigator.of(context).pop();
            } else if (state is CustomerRegistrationFailureState) {
              showPlatformDialog<void>(
                context: context,
                builder: (_) => BasicDialogAlert(
                  title: Text(
                    'Ошибка при регистрации клиента',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  content: Text(
                    'Возможно, клиент с таким электронным адресом уже зарегистрирован',
                    style: TextStyle(color: Colors.black),
                  ),
                  actions: [
                    BasicDialogAction(
                      title: Text("Ок"),
                      onPressed: () =>
                          Navigator.of(context, rootNavigator: true).pop(),
                    ),
                  ],
                ),
              );
            } else {
              throw UnimplementedError();
            }
          },
        ),
      ),
    );
  }
}
