import 'package:evenue/models/event_date.dart';

class EventDateHelper {
  static String getDurationBetween(EventDate startDate, EventDate endDate) {
    final String duration = startDate.date == endDate.date
        ? startDate.date
        : '${startDate.date} - ${endDate.date}';

    return duration;
  }
}
