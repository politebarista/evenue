import 'package:evenue/features/login/login_screen.dart';
import 'package:evenue/features/user_profile/user_profile_bloc.dart';
import 'package:evenue/stores/repositories_store.dart';
import 'package:evenue/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class UserProfileWidget extends StatelessWidget {
  const UserProfileWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserProfileBloc(
        context.read<RepositoriesStore>().userRepository,
      ),
      child: BlocBuilder<UserProfileBloc, UserProfileState>(
        builder: (context, state) {
          if (state is NotAuthorizedUserProfileState) {
            return LoginScreen();
          } else if (state is AuthorizedUserProfileState) {
            return SafeArea(
              child: Scaffold(
                body: Column(
                  children: [
                    Text('вы уже авторизованы'),
                    MaterialButton(
                      onPressed: () {
                        print('log out');
                        context.read<UserProfileBloc>().add(
                              LogOutUserProfileEvent(),
                            );
                      },
                      child: Text('Log out'),
                    ),
                  ],
                ),
              ),
            );
          } else {
            throw UnimplementedError();
          }
        },
      ),
    );
  }
}
