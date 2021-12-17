import 'dart:convert';

import 'package:evenue/common/definition/app_definition.dart';
import 'package:evenue/models/event.dart';
import 'package:http/http.dart' as http;

class EventsApi {
  final AppDefinition _appDef;

  EventsApi(this._appDef);

  Future<List<Event>> getEvents() async {
    final getEventsUrl = 'getEvents';

    final response = await http.get(
      Uri.parse(_appDef.baseUrl + getEventsUrl),
    );
    final body = jsonDecode(response.body);
    final events = <Event>[];
    for (Map<String, dynamic> event in body) {
      events.add(Event.fromJson(event));
    }

    return events;
  }
}