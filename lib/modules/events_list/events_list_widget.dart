import 'package:evenue/common/ui/custom_paddings.dart';
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
        final int cardInRowCount = 2;
        final double horizontalCardsSpacing = 16;
        final double verticalCardsSpacing = 8;

        final cardWidth =
            (constraints.maxWidth - horizontalCardsSpacing) / cardInRowCount;

        return Column(
          children: [
            CustomPaddings.v8,
            Wrap(
              spacing: verticalCardsSpacing,
              runSpacing: horizontalCardsSpacing,
              children: [
                for (Event e in events)
                  EventWidget(
                    event: e,
                    cardWidth: cardWidth,
                  ),
              ],
            ),
            CustomPaddings.v8,
          ],
        );
      },
    );
  }
}
