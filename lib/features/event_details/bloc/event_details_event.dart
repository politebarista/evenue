part of 'event_details_bloc.dart';

sealed class EventDetailsEvent {}

final class EventDetailsLoadDetailsEvent extends EventDetailsEvent {
  final Event event;

  EventDetailsLoadDetailsEvent(this.event);
}
