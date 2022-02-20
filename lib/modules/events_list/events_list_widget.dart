import 'package:evenue/common/ui/indent_widget.dart';
import 'package:evenue/models/event.dart';
import 'package:evenue/modules/events_list/event_widget.dart';
import 'package:flutter/material.dart';

class EventsListWidget extends StatelessWidget {
  final List<Event> events;

  const EventsListWidget({required this.events, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => IndentWidget(
        child: LayoutBuilder(
          builder: (context, constraints) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: EventWidget(
              event: events[index],
              cardWidth: constraints.maxWidth,
            ),
          ),
        ),
      ),
      itemCount: events.length,
    );
  }
}
