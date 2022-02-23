import 'package:evenue/event_sorting/event_sorting.dart';
import 'package:evenue/models/event.dart';

class EventSortingByDate extends EventSorting {
  final bool isAscending;

  EventSortingByDate({this.isAscending = true});

  List<Event> sort(List<Event> events) {
    final sortedEvents = _sort(events);

    return isAscending ? sortedEvents : sortedEvents.reversed.toList();
  }

  /// It's a quick sorting
  List<Event> _sort(List<Event> events) {
    if (events.length < 2) {
      return events;
    }

    final pivot = events.length ~/ 2;
    final pivotValueSortingDate = events[pivot].startDate.sortingDate;

    final largerValues = <Event>[];
    final lessValues = <Event>[];
    for (int i = 0; i < events.length; i++) {
      if (i == pivot) {
        continue;
      }
      if (events[i].startDate.sortingDate >= pivotValueSortingDate) {
        largerValues.add(events[i]);
      } else {
        lessValues.add(events[i]);
      }
    }

    return _sort(lessValues) + [events[pivot]] + _sort(largerValues);
  }
}
