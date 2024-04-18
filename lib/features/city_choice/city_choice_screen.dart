import 'package:evenue/common/ui/custom_text_styles.dart';
import 'package:evenue/common/ui/pending_widget.dart';
import 'package:evenue/common/ui/row_button.dart';
import 'package:evenue/features/navigation_controller/navigation_controller_widget.dart';
import 'package:evenue/features/city_choice/city_choice_bloc.dart';
import 'package:evenue/stores/repositories_store.dart';
import 'package:evenue/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CityChoiceScreen extends StatelessWidget {
  const CityChoiceScreen({Key? key}) : super(key: key);

  _chooseCity(BuildContext context, String cityId) =>
      context.read<CityChoiceBloc>().add(
            CityChoiceSaveSelectedCityEvent(cityId),
          );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Evenue')),
      body: BlocProvider(
        create: (_) => CityChoiceBloc(
          context.read<UserStore>(),
          context.read<RepositoriesStore>().citiesRepository,
        )..add(CityChoiceLoadCitiesEvent()),
        child: BlocConsumer<CityChoiceBloc, CityChoiceState>(
          listenWhen: (_, current) => current is CityChoiceLoadEventsState,
          buildWhen: (_, current) =>
              current is CityChoicePendingState ||
              current is CityChoiceDefaultState,
          builder: (context, state) {
            if (state is CityChoicePendingState) {
              return Center(child: PendingWidget());
            } else if (state is CityChoiceDefaultState) {
              return SizedBox(
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Text(
                        'Выберите город',
                        style: customTextStyles.title,
                      ),
                    ),
                    RowButton(
                      text: 'Все города',
                      // TODO: replace the value for any city
                      onTap: () => _chooseCity(context, 'Any'),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.cities.length,
                        itemBuilder: (context, index) => RowButton(
                          text: state.cities[index].name,
                          onTap: () => _chooseCity(
                            context,
                            state.cities[index].id,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              throw UnimplementedError();
            }
          },
          listener: (context, state) {
            if (state is CityChoiceLoadEventsState) {
              Navigator.of(context)
                ..popUntil((route) => route.isFirst)
                ..pushReplacement(
                  MaterialPageRoute(
                    builder: (_) => NavigationControllerWidget(),
                  ),
                );
            } else {
              throw UnimplementedError();
            }
          },
        ),
      ),
    );
  }
}
