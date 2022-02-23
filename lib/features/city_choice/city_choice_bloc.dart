import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:evenue/features/city_choice/cities_repository.dart';
import 'package:evenue/models/city.dart';
import 'package:meta/meta.dart';

part 'city_choice_event.dart';

part 'city_choice_state.dart';

class CityChoiceBloc extends Bloc<CityChoiceEvent, CityChoiceState> {
  final CitiesRepository _citiesRepository;

  CityChoiceBloc(CitiesRepository citiesRepository)
      : _citiesRepository = citiesRepository,
        super(CityChoicePendingState()) {
    on<CityChoiceLoadEvent>(_load);
  }

  _load(CityChoiceLoadEvent _, Emitter<CityChoiceState> emit) async {
    final cities = await _citiesRepository.getCities();
    emit(CityChoiceDefaultState(cities));
  }
}
