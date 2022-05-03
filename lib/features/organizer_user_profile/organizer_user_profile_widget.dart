import 'package:evenue/features/user_profile/user_profile_bloc.dart';
import 'package:evenue/models/organizer.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class OrganizerUserProfileWidget extends StatelessWidget {
  final Organizer organizer;

  const OrganizerUserProfileWidget({
    required this.organizer,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(organizer.name)),
      body: Column(
        children: [
          Text('Название - ${organizer.name}'),
          // TODO: add some others displaying params about organizer
          MaterialButton(
            onPressed: () => context.read<UserProfileBloc>().add(
                  LogOutUserProfileEvent(),
                ),
            child: Text('Выйти'),
          ),
        ],
      ),
    );
  }
}
