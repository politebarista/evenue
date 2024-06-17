import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evenue/common/events_sorting.dart';
import 'package:evenue/error_logger/error_logger.dart';
import 'package:evenue/models/event.dart';
import 'package:evenue/repositories/events_repository/events_repository.dart';
import 'package:meta/meta.dart';

part 'events_event.dart';

part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final ErrorLogger _errorLogger;
  final String? _cityId;
  final EventsRepository _eventsRepository;

  bool _isEventsLoading = false;

  EventsBloc(
    ErrorLogger errorLogger,
    String? cityId,
    EventsRepository eventsRepository,
  )   : _errorLogger = errorLogger,
        _cityId = cityId,
        _eventsRepository = eventsRepository,
        super(EventsPendingState()) {
    on<LoadEventsEvent>(_loadEvents);
    on<SortEventsEvent>(_sortEvents);
    on<RefreshEventsEvent>(_refreshEvents);
  }

  _loadEvents(LoadEventsEvent event, Emitter<EventsState> emit) async {
    if (_isEventsLoading) return;
    try {
      _isEventsLoading = true;

      final eventsInfo = await _eventsRepository.getEventsInfo(
        cityId: _cityId,
        skipCount: event.oldEvents.length,
        takeCount: null,
        eventsSorting: event.sorting,
      );

      emit(EventsDefaultState(
        [...event.oldEvents, ...eventsInfo.events],
        eventsInfo.eventsTotal,
      ));
      _isEventsLoading = false;
    } catch (e, stackTrace) {
      await _errorLogger.sendError(e, stackTrace);
      _isEventsLoading = false;
      emit(EventsErrorState());
    }
  }

  _sortEvents(SortEventsEvent event, Emitter<EventsState> emit) {
    emit(EventsPendingState());

    add(LoadEventsEvent([], sorting: event.sorting));
  }

  _refreshEvents(RefreshEventsEvent _, Emitter<EventsState> emit) async {
    emit(EventsPendingState());
    add(LoadEventsEvent([]));
  }
}
