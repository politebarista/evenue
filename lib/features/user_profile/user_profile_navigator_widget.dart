import 'package:evenue/features/user_profile/user_profile_widget.dart';
import 'package:flutter/material.dart';

class UserProfileNavigatorWidget extends StatelessWidget {
  UserProfileNavigatorWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (_) => MaterialPageRoute(
        builder: (context) => UserProfileWidget(),
      ),
    );
  }
}
