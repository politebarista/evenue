part of 'city_choice_bloc.dart';

@immutable
abstract class CityChoiceEvent {}

class CityChoiceLoadCitiesEvent extends CityChoiceEvent {}

class CityChoiceSaveSelectedCityEvent extends CityChoiceEvent {
  final String cityId;

  CityChoiceSaveSelectedCityEvent(this.cityId);
}
