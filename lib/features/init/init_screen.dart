import 'package:evenue/features/city_choice/city_choice_screen.dart';
import 'package:evenue/features/init/init_bloc.dart';
import 'package:evenue/features/navigation_controller/navigation_controller_widget.dart';
import 'package:evenue/stores/repositories_store.dart';
import 'package:evenue/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class InitScreen extends StatelessWidget {
  const InitScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<InitBloc>(
      create: (_) => InitBloc()..add(InitEvent()),
      child: BlocBuilder<InitBloc, InitState>(
        builder: (context, state) {
          if (state is InitNotReadyState) {
            return Text('init'); // TODO replace with splash
          } else if (state is InitReadyState) {
            return MultiProvider(
              providers: [
                Provider<UserStore>(create: (_) => state.userStore),
                Provider<RepositoriesStore>(
                  create: (_) => state.repositoriesStore,
                ),
              ],
              child: Navigator(
                onGenerateRoute: (_) => MaterialPageRoute(
                  builder: (_) => state.userStore.selectedCityId != null
                      ? NavigationControllerWidget()
                      : CityChoiceScreen(),
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
