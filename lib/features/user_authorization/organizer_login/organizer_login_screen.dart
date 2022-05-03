import 'package:evenue/common/ui/custom_text_field.dart';
import 'package:evenue/common/ui/evenue_button.dart';
import 'package:evenue/common/ui/pending_widget.dart';
import 'package:evenue/features/user_authorization/organizer_login/organizer_login_bloc.dart';
import 'package:evenue/features/user_profile/user_profile_bloc.dart';
import 'package:evenue/stores/repositories_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(controller: _passwordTextController),
                    const SizedBox(height: 8),
                    EvenueButton(
                      onTap: () => context.read<OrganizerLoginBloc>().add(
                            LoginOrganizerEvent(
                              _contactPersonEmailTextController.text,
                              _passwordTextController.text,
                            ),
                          ),
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
            if (state is OrganizerLoginInitialState) {
              print('failure while login organizer'); // TODO: add handling
            } else {
              throw UnimplementedError();
            }
          },
        ),
      ),
    );
  }
}
