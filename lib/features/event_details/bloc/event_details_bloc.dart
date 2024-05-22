import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evenue/features/event_details/models/detailed_event.dart';
import 'package:evenue/models/event.dart';
import 'package:evenue/repositories/events_repository/events_repository.dart';

part 'event_details_event.dart';
part 'event_details_state.dart';

class EventDetailsBloc extends Bloc<EventDetailsEvent, EventDetailsState> {
  final EventsRepository _eventsRepository;

  EventDetailsBloc(Event event, EventsRepository eventsRepository)
      : _eventsRepository = eventsRepository,
        super(EventDetailsInfoState(DetailedEvent.fromEvent(event, null))) {
    on<EventDetailsLoadDetailsEvent>(_loadDetails);
  }

  Future<void> _loadDetails(
    EventDetailsLoadDetailsEvent event,
    Emitter<EventDetailsState> emit,
  ) async {
    try {
      final detailedEvent = await _eventsRepository.getDetailedEvent(
        eventId: event.event.id,
      );

      emit(EventDetailsInfoState(detailedEvent!));
    } catch (e, stackTrace) {
      // TODO: add error logging
      emit(EventDetailsErrorState());
    }
  }
}
