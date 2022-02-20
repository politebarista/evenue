import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:evenue/common/config.dart';
import 'package:evenue/event_sorting/event_sorting.dart';
import 'package:evenue/models/event.dart';
import 'package:evenue/modules/events_list/events_api.dart';
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

  _getEvents(GetEventsEvent _, Emitter<EventsState> emit) async {
    try {
      final events = await _api.getEvents();

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
