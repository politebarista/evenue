import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'organizer_login_event.dart';
part 'organizer_login_state.dart';

class OrganizerLoginBloc extends Bloc<OrganizerLoginEvent, OrganizerLoginState> {
  OrganizerLoginBloc() : super(OrganizerLoginInitialState()) {
    on<OrganizerLoginEvent>((event, emit) {
      print('organizer login event is empty. Need to implement it');
      // TODO: implement event handler
    });
  }
}
