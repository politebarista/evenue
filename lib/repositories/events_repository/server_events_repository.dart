import 'dart:convert';

import 'package:evenue/features/event_details/models/detailed_event.dart';

import 'events_repository.dart';

import 'package:evenue/common/definition/app_definition.dart';
import 'package:evenue/models/event.dart';
import 'package:http/http.dart' as http;

class ServerEventsRepository implements EventsRepository {
  final AppDefinition _appDef;

  ServerEventsRepository(this._appDef);

  Future<List<Event>> getEvents({String? cityId}) async {
    final getEventsUrl = 'getEvents';

    final requestBody = jsonEncode(<String, dynamic>{
      'cityId': cityId,
    });
    final response = await http.post(
      Uri.parse(_appDef.baseUrl + getEventsUrl),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
      body: requestBody,
    );
    final body = jsonDecode(response.body);
    final events = <Event>[];
    for (Map<String, dynamic> event in body) {
      events.add(Event.fromJson(event));
    }

    return events;
  }

  Future<DetailedEvent?> getDetailedEvent({String? eventId}) async {
    final getEventsUrl = 'getDetailedEvent';
    final url = Uri.parse(_appDef.baseUrl + getEventsUrl).replace(
      queryParameters: {'eventId': eventId},
    );
    final response = await http.get(
      url,
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    );

    final body = jsonDecode(response.body);
    final detailedEvent = DetailedEvent.fromJson(body);

    return detailedEvent;
  }
}
