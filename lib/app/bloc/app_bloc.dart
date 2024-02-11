import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:second_hand_app/app/constants/enum/enums.dart';
import 'package:second_hand_app/app/services/supabase_functions.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required this.supabaseFunctions,
  }) : super(AppState()) {
    on<AppEvent>((event, emit) {});
    on<AppCheckSesion>(_checkSesion);
    on<AppLoginUserEvent>(_loginUser);
    on<AppLogoutUserEvent>(_logoutUser);
  }
  final SupabaseFunctions supabaseFunctions;

  Future<void> _checkSesion(
    AppCheckSesion event,
    Emitter<AppState> emit,
  ) async {
    try {
      final session = await supabaseFunctions.checkSession();
      if (session != null) {
        emit(state.copyWith(appState: AppStateEnum.autorized));
      } else {
        emit(state.copyWith(appState: AppStateEnum.unautorized));
      }
    } catch (e) {}
  }

  Future<void> _loginUser(
    AppLoginUserEvent event,
    Emitter<AppState> emit,
  ) async {
    try {
      print('przed');
      await supabaseFunctions.logIn(
        email: event.email,
        password: event.password,
      );
      print('Logged in');
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> _logoutUser(
    AppLogoutUserEvent event,
    Emitter<AppState> emit,
  ) async {
    try {
      await supabaseFunctions.logOut();
      emit(state.copyWith(appState: AppStateEnum.unautorized));
    } catch (e) {}
  }
}
