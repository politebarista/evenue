import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evenue/common/config.dart';
import 'package:evenue/event_sorting/event_sorting.dart';
import 'package:evenue/models/event.dart';
import 'package:evenue/features/events/events_api.dart';
import 'package:meta/meta.dart';

part 'events_event.dart';

part 'events_state.dart';

class EventsBloc extends Bloc<EventsEvent, EventsState> {
  final EventsApi _api;

  EventsBloc()
      : _api = EventsApi(Config.appDef),
        super(EventsPendingState()) {
    on<GetEventsEvent>(_getEvents);
    on<SortEventsEvent>(_sortEvents);
  }

  _getEvents(GetEventsEvent event, Emitter<EventsState> emit) async {
    try {
      final events = await _api.getEvents(cityId: event.cityId);

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
