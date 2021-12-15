import 'package:evenue/models/organizer.dart';
import 'package:json_annotation/json_annotation.dart';

part 'event.g.dart';

@JsonSerializable()
class Event {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final double oldPrice;
  final double price;
  final Organizer organizer;

  Event(
    this.id,
    this.name,
    this.description,
    this.imageUrl,
    this.oldPrice,
    this.price,
    this.organizer,
  );

  factory Event.fromJson(Map<String, dynamic> json) => _$EventFromJson(json);
}
