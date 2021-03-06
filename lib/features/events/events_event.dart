part of 'events_bloc.dart';

@immutable
abstract class EventsEvent {}

class GetEventsEvent extends EventsEvent {
  final String? cityId;

  GetEventsEvent(this.cityId);
}

class SortEventsEvent extends EventsEvent {
  final List<Event> events;
  final EventSorting sorting;

  SortEventsEvent(this.events, this.sorting);
}
