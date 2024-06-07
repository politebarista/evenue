import 'package:evenue/common/events_sorting.dart';
import 'package:evenue/features/event_details/models/detailed_event.dart';
import 'package:evenue/models/events_info.dart';

abstract interface class EventsRepository {
  Future<EventsInfo> getEventsInfo({
    required String? cityId,
    required int? skipCount,
    required int? takeCount,
    required EventsSorting? eventsSorting,
  });

  Future<DetailedEvent?> getDetailedEvent({required String? eventId});
}