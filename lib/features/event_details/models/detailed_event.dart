import 'package:evenue/models/event.dart';
import 'package:evenue/models/event_date.dart';
import 'package:evenue/models/organizer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'detailed_event.g.dart';

@JsonSerializable()
final class DetailedEvent extends Event {
  final bool? canTicketBePurchased;

  const DetailedEvent(
    String id,
    String name,
    String description,
    String imageUrl,
    double oldPrice,
    double price,
    Organizer organizer,
    EventDate startDate,
    EventDate endDate,
    this.canTicketBePurchased,
  ) : super(
          id,
          name,
          description,
          imageUrl,
          oldPrice,
          price,
          organizer,
          startDate,
          endDate,
        );

  factory DetailedEvent.fromEvent(Event event, bool? canTicketBePurchased) {
    return DetailedEvent(
      event.id,
      event.name,
      event.description,
      event.imageUrl,
      event.oldPrice,
      event.price,
      event.organizer,
      event.startDate,
      event.endDate,
      canTicketBePurchased,
    );
  }

  factory DetailedEvent.fromJson(Map<String, dynamic> json) => _$DetailedEventFromJson(json);
}
