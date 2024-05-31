import 'package:json_annotation/json_annotation.dart';

import 'event.dart';

part 'events_info.g.dart';

@JsonSerializable()
class EventsInfo {
  final List<Event> events;
  final int eventsTotal;

  const EventsInfo(
    this.events,
    this.eventsTotal,
  );

  factory EventsInfo.fromJson(Map<String, dynamic> json) => _$EventsInfoFromJson(json);
}
