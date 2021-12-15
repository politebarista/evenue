import 'package:evenue/models/event.dart';
import 'package:evenue/modules/events_list/event_widget.dart';
import 'package:flutter/material.dart';

class EventsListWidget extends StatelessWidget {
  final List<Event> events;

  const EventsListWidget({required this.events, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Wrap(
          spacing: 10,
          runSpacing: 10,
          children: [
            for (Event e in events) EventWidget(event: e,),
          ],
        ),
      ],
    );
  }
}
