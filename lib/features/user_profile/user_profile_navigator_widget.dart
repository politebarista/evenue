import 'package:evenue/features/user_profile/user_profile_bloc.dart';
import 'package:evenue/features/user_profile/user_profile_widget.dart';
import 'package:evenue/stores/repositories_store.dart';
import 'package:evenue/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class UserProfileNavigatorWidget extends StatelessWidget {
  UserProfileNavigatorWidget({Key? key}) : super(key: key);

  // TODO: Rather strange navigation. I'm sure it needs to be changed

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserProfileBloc(
        context.read<UserStore>(),
        context.read<RepositoriesStore>().customerRepository,
        context.read<RepositoriesStore>().organizerRepository,
      )..add(CheckAuthorizationUserProfileEvent()),
      child: Navigator(
        onGenerateRoute: (_) => MaterialPageRoute(
          builder: (context) => UserProfileWidget(),
        ),
      ),
    );
  }
}
