import 'package:evenue/common/ui/pending_widget.dart';
import 'package:evenue/event_sorting/event_sorting_by_date.dart';
import 'package:evenue/modules/events_list/events_bloc.dart';
import 'package:evenue/modules/events_list/events_list_widget.dart';
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
              return Column(
                children: [
                  Row(
                    children: [
                      Container(
                        color: Colors.pink,
                        child: MaterialButton(
                          onPressed: () => context.read<EventsBloc>().add(
                                SortEventsEvent(
                                  state.events,
                                  EventSortingByDate(),
                                ),
                              ),
                          child: Text('sort by date asc'),
                        ),
                      ),
                      Container(
                        color: Colors.green,
                        child: MaterialButton(
                          onPressed: () => context.read<EventsBloc>().add(
                            SortEventsEvent(
                              state.events,
                              EventSortingByDate(isAscending: false),
                            ),
                          ),
                          child: Text('sort by date desc'),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: EventsListWidget(events: state.events),
                  ),
                ],
              );
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
