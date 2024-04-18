import 'package:evenue/common/email_helper.dart';
import 'package:evenue/common/password_helper.dart';
import 'package:evenue/common/ui/custom_text_field.dart';
import 'package:evenue/common/ui/evenue_button.dart';
import 'package:evenue/common/ui/pending_widget.dart';
import 'package:evenue/features/user_authorization/organizer_login/organizer_login_bloc.dart';
import 'package:evenue/features/user_profile/user_profile_bloc.dart';
import 'package:evenue/stores/repositories_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

import '../user_authorization_bloc.dart';

class OrganizerLoginScreen extends StatefulWidget {
  const OrganizerLoginScreen({Key? key}) : super(key: key);

  @override
  State<OrganizerLoginScreen> createState() => _OrganizerLoginScreenState();
}

class _OrganizerLoginScreenState extends State<OrganizerLoginScreen> {
  late final TextEditingController _contactPersonEmailTextController;
  late final TextEditingController _passwordTextController;

  @override
  void initState() {
    _contactPersonEmailTextController = TextEditingController();
    _passwordTextController = TextEditingController();
    super.initState();
  }

  void _login(final BuildContext context) {
    if (!EmailHelper.isEmailValid(_contactPersonEmailTextController.text)) {
      _showDialog(context, 'Email введен неверно');
      return;
    }

    if (!PasswordHelper.isPasswordValid(_passwordTextController.text)) {
      _showDialog(context, 'Пароль введен неверно');
      return;
    }

    context.read<OrganizerLoginBloc>().add(
          LoginOrganizerEvent(
            _contactPersonEmailTextController.text,
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
      appBar: AppBar(title: Text('Авторизация - Организатор')),
      body: BlocProvider<OrganizerLoginBloc>(
        create: (_) => OrganizerLoginBloc(
          context.read<RepositoriesStore>().organizerRepository,
          context.read<UserProfileBloc>(),
        ),
        child: BlocConsumer<OrganizerLoginBloc, OrganizerLoginState>(
          buildWhen: (_, current) =>
              current is OrganizerLoginPendingState ||
              current is OrganizerLoginInitialState,
          listenWhen: (_, current) => current is OrganizerLoginFailureState,
          builder: (context, state) {
            if (state is OrganizerLoginPendingState) {
              return LayoutBuilder(builder: (context, constraints) {
                return SizedBox(
                  width: constraints.maxWidth,
                  height: constraints.maxHeight,
                  child: Center(child: PendingWidget()),
                );
              });
            } else if (state is OrganizerLoginInitialState) {
              return Container(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _contactPersonEmailTextController,
                      label: 'Email контактного лица',
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
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
                                ChangeUserAuthorizationMethodEvent(true),
                              ),
                      child: Text('Я клиент'),
                    ),
                  ],
                ),
              );
            } else {
              throw UnimplementedError();
            }
          },
          listener: (context, state) {
            if (state is OrganizerLoginFailureState) {
              _showDialog(
                context,
                'Ошибка при авторизации организатора',
                'Возможно этот организатор не зарегистрирован',
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
