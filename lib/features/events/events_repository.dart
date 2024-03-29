import 'dart:convert';

import 'package:evenue/common/definition/app_definition.dart';
import 'package:evenue/models/event.dart';
import 'package:http/http.dart' as http;

// TODO: Reform the api into a repository
class EventsRepository {
  final AppDefinition _appDef;

  EventsRepository(this._appDef);

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
}
