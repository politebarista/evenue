import 'package:evenue/event_sorting/event_sorting.dart';
import 'package:evenue/models/event.dart';

class EventSortingByPrice extends EventSorting {
  final bool isAscending;

  EventSortingByPrice({this.isAscending = true});

  List<Event> sort(List<Event> events) {
    final sortedEvents = _sort(events);

    return isAscending ? sortedEvents : sortedEvents.reversed.toList();
  }

  List<Event> _sort(List<Event> events) {
    if (events.length < 2) {
      return events;
    }

    final pivot = events.length ~/ 2;

    final largerValues = <Event>[];
    final lessValues = <Event>[];
    for (int i = 0; i < events.length; i++) {
      if (i == pivot) {
        continue;
      }
      if (events[i].price >= events[pivot].price) {
        largerValues.add(events[i]);
      } else {
        lessValues.add(events[i]);
      }
    }

    return _sort(lessValues) + [events[pivot]] + _sort(largerValues);
  }
}
