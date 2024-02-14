import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';
import 'package:second_hand_app/app/constants/enum/enums.dart';
import 'package:second_hand_app/app/services/supabase_functions.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'app_event.dart';
part 'app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({
    required this.supabaseFunctions,
  }) : super(AppState(
          isLoading: false,
          errorMessage: '',
          isMailSent: false,
        )) {
    on<AppEvent>((event, emit) {});
    on<AppCheckSesion>(_checkSesion);
    on<AppLoginUserEvent>(_loginUser);
    on<AppRegisterUserEvent>(_registerUser);
    on<AppLogoutUserEvent>(_logoutUser);
    on<AppResetPassword>(_resetPassword);
    on<AppResetError>(_resetError);
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
      emit(state.copyWith(isLoading: true));
      await supabaseFunctions.logIn(
        email: event.email,
        password: event.password,
      );

      emit(
        state.copyWith(
          appState: AppStateEnum.autorized,
          isLoading: false,
          errorMessage: '',
        ),
      );
      event.onDone.call();
    } on AuthException catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          isLoading: false,
        ),
      );
    }
  }

  Future<void> _registerUser(
    AppRegisterUserEvent event,
    Emitter<AppState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      await supabaseFunctions.register(
        email: event.email,
        password: event.password,
      );
      emit(
        state.copyWith(
          appState: AppStateEnum.autorized,
          isLoading: false,
          errorMessage: '',
        ),
      );
      event.onDone.call();
    } on AuthException catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.message,
          isLoading: false,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          errorMessage: e.toString(),
          isLoading: false,
        ),
      );
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

  Future<void> _resetPassword(
    AppResetPassword event,
    Emitter<AppState> emit,
  ) async {
    try {
      emit(state.copyWith(isLoading: true));
      await supabaseFunctions.resetPassword(email: event.email);
      emit(
        state.copyWith(
          isLoading: false,
          isMailSent: true,
          errorMessage: '',
        ),
      );
    } on AuthException catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          isMailSent: false,
          errorMessage: e.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isLoading: false,
          isMailSent: false,
          errorMessage: e.toString(),
        ),
      );
    }
  }

  void _resetError(
    AppResetError event,
    Emitter<AppState> emit,
  ) {
    emit(state.copyWith(errorMessage: ''));
  }
}
