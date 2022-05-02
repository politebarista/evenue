import 'package:evenue/features/user_authorization/customer_login/customer_login_screen.dart';
import 'package:evenue/features/user_authorization/organizer_login/organizer_login_screen.dart';
import 'package:evenue/features/user_authorization/user_authorization_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserAuthorizationScreen extends StatelessWidget {
  const UserAuthorizationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserAuthorizationBloc>(
      create: (_) => UserAuthorizationBloc(),
      child: BlocBuilder<UserAuthorizationBloc, UserAuthorizationState>(
        builder: (context, state) {
          if (state is CustomerUserAuthorizationState) {
            return CustomerLoginScreen();
          } else if (state is OrganizerUserAuthorizationState) {
            return OrganizerLoginScreen();
          } else {
            throw UnimplementedError();
          }
        },
      ),
    );
  }
}
