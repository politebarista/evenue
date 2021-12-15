part of 'events_bloc.dart';

@immutable
abstract class EventsState extends Equatable {}

class EventsPendingState extends EventsState {
  @override
  List<Object> get props => [];
}

class EventsDefaultState extends EventsState {
  final List<Event> events;

  @override
  List<Object> get props => [events];

  EventsDefaultState(this.events);
}

class EventsErrorState extends EventsState {
  @override
  List<Object> get props => [];
}