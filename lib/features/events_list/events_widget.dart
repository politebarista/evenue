import 'package:evenue/common/ui/pending_widget.dart';
import 'package:evenue/features/city_choice/city_choice_screen.dart';
import 'package:evenue/features/events_list/events_bloc.dart';
import 'package:evenue/features/events_list/events_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsWidget extends StatelessWidget {
  final String? cityId;

  const EventsWidget({this.cityId, Key? key}) : super(key: key);

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
        create: (context) => EventsBloc()..add(GetEventsEvent(cityId)),
        child: Scaffold(
          body: BlocBuilder<EventsBloc, EventsState>(
            builder: (context, state) {
              if (state is EventsPendingState) {
                return Center(child: PendingWidget());
              } else if (state is EventsDefaultState) {
                return EventsListWidget(state: state);
              } else if (state is EventsErrorState) {
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
