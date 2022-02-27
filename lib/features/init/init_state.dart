part of 'init_bloc.dart';

@immutable
abstract class InitState {}

class InitNotReadyState extends InitState {}

class InitReadyState extends InitState {
  final UserStore userStore;
  final RepositoriesStore repositoriesStore;

  InitReadyState(this.userStore, this.repositoriesStore);
}
