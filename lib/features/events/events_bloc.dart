import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evenue/event_sorting/event_sorting.dart';
import 'package:evenue/models/event.dart';
import 'package:evenue/repositories/events_repository/events_repository.dart';
import 'package:meta/meta.dart';

part 'events_event.dart';

part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final EventsRepository _eventsRepository;

  EventsBloc(EventsRepository eventsRepository)
      : _eventsRepository = eventsRepository,
        super(EventsPendingState()) {
    on<GetEventsEvent>(_getEvents);
    on<SortEventsEvent>(_sortEvents);
  }

  _getEvents(GetEventsEvent event, Emitter<EventsState> emit) async {
    try {
      final events = await _eventsRepository.getEvents(cityId: event.cityId);

      emit(EventsDefaultState(events));
    } catch (e) {
      emit(EventsErrorState());
    }
  }

  _sortEvents(SortEventsEvent event, Emitter<EventsState> emit) async {
    emit(EventsPendingState());

    final sortedEvents = event.sorting.sort(event.events);

    emit(EventsDefaultState(sortedEvents));
  }
}
