// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'app_bloc.dart';

@immutable
class AppEvent {}

class AppCheckSesion extends AppEvent {}

class AppLoginUserEvent extends AppEvent {
  final String email;
  final String password;

  AppLoginUserEvent({
    required this.email,
    required this.password,
  });
}

class AppLogoutUserEvent extends AppEvent {}
