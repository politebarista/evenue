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
          Text('Описание - ${organizer.description}'),
          Text('E-mail контактного лица - ${organizer.contactPersonEmail}'),
          Text('Имя контактного лица - ${organizer.contactPersonName}'),
          Text(
            'Номер телефона контактного лица - ${organizer.contactPersonPhone}',
          ),
          Text('ИНН - ${organizer.inn}'),
          MaterialButton(
            // TODO: add create event feature
            onPressed: () => print('pressed add event button'),
            child: Text('Создать мероприятие'),
          ),
          MaterialButton(
            // TODO: add show all events feature
            onPressed: () => print('pressed show events button'),
            child: Text('Показать все мероприятия организатора'),
          ),
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
