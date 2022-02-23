import 'package:evenue/event_sorting/event_sorting.dart';
import 'package:evenue/models/event.dart';

class EventSortingByName extends EventSorting {
  final bool isAscending;

  EventSortingByName({this.isAscending = true});

  List<Event> sort(List<Event> events) {
    events.sort((a, b) => a.name.compareTo(b.name));
    return isAscending ? events : events.reversed.toList();
  }
}