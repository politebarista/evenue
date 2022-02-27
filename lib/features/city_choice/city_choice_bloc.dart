import 'package:bloc/bloc.dart';
import 'package:evenue/features/city_choice/cities_repository.dart';
import 'package:evenue/models/city.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'city_choice_event.dart';

part 'city_choice_state.dart';

class CityChoiceBloc extends Bloc<CityChoiceEvent, CityChoiceState> {
  final CitiesRepository _citiesRepository;

  CityChoiceBloc(CitiesRepository citiesRepository)
      : _citiesRepository = citiesRepository,
        super(CityChoicePendingState()) {
    on<CityChoiceLoadCitiesEvent>(_load);
    on<CityChoiceSaveSelectedCityEvent>(_saveSelectedCity);
  }

  _load(CityChoiceLoadCitiesEvent _, Emitter<CityChoiceState> emit) async {
    final cities = await _citiesRepository.getCities();
    emit(CityChoiceDefaultState(cities));
  }

  _saveSelectedCity(
    CityChoiceSaveSelectedCityEvent event,
    Emitter<CityChoiceState> emit,
  ) async {
    emit(CityChoicePendingState());
    
    // TODO: put in the user store
    final sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.setString('selectedCity', event.cityId);

    emit(CityChoiceLoadEventsState(event.cityId));
  }
}
