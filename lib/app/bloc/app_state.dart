// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

class AppState {
  final AppStateEnum appState;
  final bool isLoading;
  final String errorMessage;

  AppState({
    required this.isLoading,
    required this.errorMessage,
    this.appState = AppStateEnum.initial,
  });

  AppState copyWith({
    AppStateEnum? appState,
    bool? isLoading,
    String? errorMessage,
  }) {
    return AppState(
      appState: appState ?? this.appState,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
