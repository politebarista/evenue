part of 'events_bloc.dart';

@immutable
abstract class EventsState {}

class EventsPendingState extends EventsState {}

class EventsDefaultState extends EventsState {}
