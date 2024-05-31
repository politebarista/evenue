part of 'events_bloc.dart';

@immutable
abstract class EventsState extends Equatable {}

class EventsPendingState extends EventsState {
  @override
  List<Object> get props => [];
}

class EventsDefaultState extends EventsState {
  final List<Event> events;
  final int eventsTotal;

  @override
  List<Object> get props => [events, eventsTotal];

  EventsDefaultState(this.events, this.eventsTotal);
}

class EventsErrorState extends EventsState {
  @override
  List<Object> get props => [];
}