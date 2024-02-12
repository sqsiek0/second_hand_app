// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

class AppState {
  final AppStateEnum appState;
  final bool isLoading;

  AppState({
    required this.isLoading,
    this.appState = AppStateEnum.initial,
  });

  AppState copyWith({
    AppStateEnum? appState,
    bool? isLoading,
  }) {
    return AppState(
      appState: appState ?? this.appState,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
