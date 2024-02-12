// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

@immutable
class AppEvent {}

class AppCheckSesion extends AppEvent {}

class AppLoginUserEvent extends AppEvent {
  final String email;
  final String password;
  final VoidCallback onDone;

  AppLoginUserEvent({
    required this.email,
    required this.password,
    required this.onDone,
  });
}

class AppRegisterUserEvent extends AppEvent {
  final String email;
  final String password;
  final VoidCallback onDone;

  AppRegisterUserEvent({
    required this.email,
    required this.password,
    required this.onDone,
  });
}

class AppResetError extends AppEvent {}

class AppLogoutUserEvent extends AppEvent {}
