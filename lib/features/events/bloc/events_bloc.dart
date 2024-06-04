import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evenue/event_sorting/event_sorting.dart';
import 'package:evenue/models/event.dart';
import 'package:evenue/repositories/events_repository/events_repository.dart';
import 'package:meta/meta.dart';

part 'events_event.dart';

part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final String? _cityId;
  final EventsRepository _eventsRepository;

  bool _isEventsLoading = false;

  EventsBloc(String? cityId, EventsRepository eventsRepository)
      : _cityId = cityId, _eventsRepository = eventsRepository,
        super(EventsPendingState()) {
    on<LoadEventsEvent>(_loadEvents);
    // on<SortEventsEvent>(_sortEvents);
    on<RefreshEventsEvent>(_refreshEvents);
  }

  _loadEvents(LoadEventsEvent event, Emitter<EventsState> emit) async {
    if (_isEventsLoading) return;
    try {
      _isEventsLoading = true;

      final eventsInfo = await _eventsRepository.getEventsInfo(
        cityId: _cityId,
        skipCount: event.oldEvents.length,
      );

      emit(EventsDefaultState(
        [...event.oldEvents, ...eventsInfo.events],
        eventsInfo.eventsTotal,
      ));
      _isEventsLoading = false;
    } catch (e) {
      // TODO: add error logging
      _isEventsLoading = false;
      emit(EventsErrorState());
    }
  }

  // _sortEvents(SortEventsEvent event, Emitter<EventsState> emit) async {
  //   emit(EventsPendingState());
  //
  //   final sortedEvents = event.sorting.sort(event.events);
  //
  //   emit(EventsDefaultState(sortedEvents, _cityId));
  // }

  _refreshEvents(RefreshEventsEvent _, Emitter<EventsState> emit) async {
    emit(EventsPendingState());
    add(LoadEventsEvent([]));
  }
}
