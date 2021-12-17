import 'package:evenue/common/ui/common_ui_provider.dart';
import 'package:evenue/models/event.dart';
import 'package:evenue/modules/events_list/event_widget.dart';
import 'package:flutter/material.dart';

class EventsListWidget extends StatelessWidget {
  final List<Event> events;

  const EventsListWidget({required this.events, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            commonUiProvider.paddings.v8,
            for (Event e in events) ...[
              EventWidget(
                event: e,
                cardWidth: constraints.maxWidth,
              ),
              commonUiProvider.paddings.v8,
            ],
          ],
        );
      },
    );
  }
}
