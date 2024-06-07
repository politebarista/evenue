import 'package:evenue/common/events_sorting.dart';
import 'package:evenue/common/ui/indent_widget.dart';
import 'package:evenue/common/ui/pending_widget.dart';
import 'package:evenue/features/city_choice/city_choice_screen.dart';
import 'package:evenue/models/event.dart';
import 'package:evenue/stores/repositories_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/events_bloc.dart';
import 'view/event_card/event_card.dart';

part 'view/events_list_widget.dart';
part 'view/sorting_selection_widget.dart';

class EventsScreen extends StatelessWidget {
  final String cityId;

  const EventsScreen(this.cityId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Evenue'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: GestureDetector(
              child: Icon(Icons.location_on_outlined),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => CityChoiceScreen(),
                ),
              ),
            ),
          ),
        ],
      ),
      body: BlocProvider(
        create: (context) => EventsBloc(
          cityId,
          context.read<RepositoriesStore>().eventsRepository,
        )..add(LoadEventsEvent([])),
        child: Scaffold(
          body: BlocBuilder<EventsBloc, EventsState>(
            builder: (context, state) {
              if (state is EventsPendingState) {
                return Center(child: PendingWidget());
              } else if (state is EventsDefaultState) {
                return _EventsListWidget(state: state);
              } else if (state is EventsErrorState) {
                // TODO: implement a more informative error screen
                return Text('error');
              } else {
                throw UnimplementedError();
              }
            },
          ),
        ),
      ),
    );
  }
}
