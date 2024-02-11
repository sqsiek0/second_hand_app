// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

class AppState {
  final AppStateEnum appState;

  AppState({
    this.appState = AppStateEnum.initial,
  });

  AppState copyWith({
    AppStateEnum? appState,
  }) {
    return AppState(
      appState: appState ?? this.appState,
    );
  }
}
