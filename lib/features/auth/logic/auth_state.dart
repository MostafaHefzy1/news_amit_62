part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}


final class LoginLoadingState extends AuthState {}
final class LoginSuccessState extends AuthState {}
final class LoginFailedState extends AuthState {}

final class RegisterLoadingState extends AuthState {}
final class RegisterSuccessState extends AuthState {}
final class RegisterFailedState extends AuthState {}