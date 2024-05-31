part of 'events_bloc.dart';

@immutable
abstract class EventsEvent {}

class LoadEventsEvent extends EventsEvent {
  final List<Event> oldEvents;

  LoadEventsEvent(this.oldEvents);
}

class SortEventsEvent extends EventsEvent {
  final List<Event> events;
  final EventSorting sorting;

  SortEventsEvent(this.events, this.sorting);
}
