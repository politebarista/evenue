import 'package:evenue/features/event_details/models/detailed_event.dart';
import 'package:evenue/models/event.dart';

abstract interface class EventsRepository {
  Future<List<Event>> getEvents({String? cityId});

  Future<DetailedEvent?> getDetailedEvent({String? eventId});
}