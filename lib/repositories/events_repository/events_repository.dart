import 'package:evenue/features/event_details/models/detailed_event.dart';
import 'package:evenue/models/events_info.dart';

abstract interface class EventsRepository {
  Future<EventsInfo> getEventsInfo({String? cityId, int skipCount, int takeCount});

  Future<DetailedEvent?> getDetailedEvent({String? eventId});
}