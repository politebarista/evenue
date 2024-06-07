import 'dart:convert';

import 'package:evenue/common/events_sorting.dart';
import 'package:evenue/features/event_details/models/detailed_event.dart';
import 'package:evenue/models/events_info.dart';
import 'events_repository.dart';
import 'package:evenue/common/definition/app_definition.dart';
import 'package:http/http.dart' as http;

class ServerEventsRepository implements EventsRepository {
  static const _defaultSkipCount = 0, _defaultTakeCount = 25;

  final AppDefinition _appDef;

  ServerEventsRepository(this._appDef);

  Future<EventsInfo> getEventsInfo({
    required String? cityId,
    required int? skipCount,
    required int? takeCount,
    required EventsSorting? eventsSorting,
  }) async {
    skipCount ??= _defaultSkipCount;
    takeCount ??= _defaultTakeCount;

    final getEventsUrl = 'getEventsInfo';
    final queryParameters = <String, dynamic>{
      'cityId': cityId,
      'skipCount': skipCount.toString(),
      'takeCount': takeCount.toString(),
      'eventsSorting': eventsSorting?.name,
    };
    final response = await http.get(
      Uri.parse(_appDef.baseUrl + getEventsUrl).replace(
        queryParameters: queryParameters,
      ),
      headers: {'Content-Type': 'application/json; charset=UTF-8'},
    );
    final body = jsonDecode(response.body);
    final eventsInfo = EventsInfo.fromJson(body);

    return eventsInfo;
  }

  Future<DetailedEvent?> getDetailedEvent({required String? eventId}) async {
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
