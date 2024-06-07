part of 'events_bloc.dart';

@immutable
abstract class EventsEvent {}

class LoadEventsEvent extends EventsEvent {
  final List<Event> oldEvents;
  final EventsSorting sorting;

  LoadEventsEvent(
    this.oldEvents, {
    this.sorting = EventsSorting.without,
  });
}

class SortEventsEvent extends EventsEvent {
  final EventsSorting sorting;

  SortEventsEvent(this.sorting);
}

class RefreshEventsEvent extends EventsEvent {}
