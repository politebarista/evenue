part of 'event_details_bloc.dart';

sealed class EventDetailsState extends Equatable {
  const EventDetailsState();
}

final class EventDetailsInfoState extends EventDetailsState {
  final DetailedEvent detailedEvent;

  @override
  List<Object?> get props => [detailedEvent];

  const EventDetailsInfoState(this.detailedEvent);
}

final class EventDetailsErrorState extends EventDetailsState {
  @override
  List<Object?> get props => [];
}
