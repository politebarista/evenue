import 'package:evenue/common/ui/indent_widget.dart';
import 'package:evenue/modules/events_list/events_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'event_widget.dart';

class EventsWidget extends StatelessWidget {
  const EventsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EventsBloc(),
      child: BlocBuilder<EventsBloc, EventsState>(
        builder: (context, state) {
          // return IndentWidget(
          //   child: Wrap(
          //     spacing: 10,
          //     runSpacing: 10,
          //     children: [
          //       EventWidget(),
          //       EventWidget(),
          //       EventWidget(),
          //     ],
          //   ),
          // );
          return Center(
            child: MaterialButton(
              onPressed: () {
                context.read<EventsBloc>().add(GetEventsEvent());
              },
              child: Text('getEvents'),
            ),
          );
        },
      ),
    );
  }
}
