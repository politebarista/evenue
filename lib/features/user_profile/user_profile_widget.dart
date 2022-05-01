import 'package:evenue/common/ui/pending_widget.dart';
import 'package:evenue/features/login/login_screen.dart';
import 'package:evenue/features/user_profile/user_profile_bloc.dart';
import 'package:evenue/stores/repositories_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (_) => UserProfileBloc(
            context.read<RepositoriesStore>().userRepository,
          )..add(CheckAuthorizationUserProfileEvent()),
          child: BlocBuilder<UserProfileBloc, UserProfileState>(
            builder: (context, state) {
              if (state is NotAuthorizedUserProfileState) {
                return LoginScreen();
              } else if (state is PendingUserProfileState) {
                return PendingWidget();
              } else if (state is AuthorizedUserProfileState) {
                return Column(
                  children: [
                    Text('вы уже авторизованы'),
                    MaterialButton(
                      onPressed: () => context.read<UserProfileBloc>().add(
                            LogOutUserProfileEvent(),
                          ),
                      child: Text('Выйти'),
                    ),
                  ],
                );
              } else {
                throw UnimplementedError();
              }
            },
          ),
        ),
      ),
    );
  }
}
