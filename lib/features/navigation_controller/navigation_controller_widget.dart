import 'package:evenue/features/events/events_screen.dart';
import 'package:evenue/features/user_profile/user_profile_navigator_widget.dart';
import 'package:evenue/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';

class NavigationControllerWidget extends StatefulWidget {
  const NavigationControllerWidget({Key? key}) : super(key: key);

  @override
  State<NavigationControllerWidget> createState() =>
      _NavigationControllerWidgetState();
}

class _NavigationControllerWidgetState
    extends State<NavigationControllerWidget> {
  int currentScreenIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: currentScreenIndex,
        children: [
          EventsScreen(context.read<UserStore>().selectedCityId!),
          UserProfileNavigatorWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentScreenIndex,
        onTap: (index) => setState(() => currentScreenIndex = index),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'Мероприятия',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Профиль',
          ),
        ],
      ),
    );
  }
}
