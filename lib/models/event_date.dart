import 'package:json_annotation/json_annotation.dart';

part 'event_date.g.dart';

@JsonSerializable()
class EventDate {
  final String dateTime;
  final String date;
  final String day;
  final String month;
  final String year;
  final String time;
  final String hours;
  final String minutes;
  final String seconds;

  int get sortingDate => int.parse('$year$month$day$hours$minutes$seconds');

  EventDate(
    this.dateTime,
    this.date,
    this.day,
    this.month,
    this.year,
    this.time,
    this.hours,
    this.minutes,
    this.seconds,
  );

  factory EventDate.fromJson(Map<String, dynamic> json) =>
      _$EventDateFromJson(json);
}
