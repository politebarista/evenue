import 'package:evenue/common/ui/pending_widget.dart';
import 'package:evenue/features/events_list/events_bloc.dart';
import 'package:evenue/features/events_list/events_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EventsWidget extends StatelessWidget {
  const EventsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventsBloc()..add(GetEventsEvent()),
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
    );
  }
}
