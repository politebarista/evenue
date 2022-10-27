import 'package:evenue/features/user_profile/user_profile_bloc.dart';
import 'package:evenue/models/customer.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class CustomerUserProfileWidget extends StatelessWidget {
  final Customer customer;

  const CustomerUserProfileWidget({
    required this.customer,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(customer.firstName)),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Имя: ${customer.firstName}'),
            Text('Фамилия: ${customer.lastName}'),
            Text('Номер телефона: ${customer.phoneNumber}'),
            Text('E-mail: ${customer.email}'),
            // MaterialButton(
            //   // TODO: add purchase history
            //   onPressed: () => print('pressed purchase history button'),
            //   child: Text('История покупок'),
            // ),
            // MaterialButton(
            //   // TODO: add change data feature
            //   onPressed: () => print('pressed change data button'),
            //   child: Text('Изменить данные'),
            // ),
            const SizedBox(height: 60),
            Center(
              child: MaterialButton(
                onPressed: () => context.read<UserProfileBloc>().add(
                      LogOutUserProfileEvent(),
                    ),
                child: Text('Выйти'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
