import 'package:evenue/features/user_profile/user_profile_widget.dart';
import 'package:flutter/material.dart';

class CustomerRegistrationWidget extends StatelessWidget {
  const CustomerRegistrationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Регистрация')),
      body: Column(
        children: [
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
    );
  }
}
