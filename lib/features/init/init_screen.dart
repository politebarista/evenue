import 'package:evenue/common/config.dart';
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
    // TODO: the functionality can be implemented without the use of a BLoC,
    //  which complicates understanding in this case
    return BlocProvider<InitBloc>(
      create: (_) => InitBloc(
        context.read<Config>(),
      )..add(InitEvent()),
      child: BlocBuilder<InitBloc, InitState>(
        builder: (context, state) {
          if (state is InitNotReadyState) {
            return Text('init'); // TODO replace with splash
          } else if (state is InitReadyState) {
            /// TODO : It seems that this data (Stores & Repositories) needs to
            /// be received and packaged into the Provider even before the
            /// launch of MaterialApp so as not to create an extra Navigator
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
