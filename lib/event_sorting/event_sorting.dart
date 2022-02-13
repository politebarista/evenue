import 'package:evenue/models/event.dart';

abstract class EventSorting {
  List<Event> sort(List<Event> event);
}