part of 'city_choice_bloc.dart';

@immutable
abstract class CityChoiceState {}

class CityChoicePendingState extends CityChoiceState {}

class CityChoiceDefaultState extends CityChoiceState {
  final List<City> cities;

  CityChoiceDefaultState(this.cities);
}

class CityChoiceLoadEventsState extends CityChoiceState {
  final String cityId;

  CityChoiceLoadEventsState(this.cityId);
}