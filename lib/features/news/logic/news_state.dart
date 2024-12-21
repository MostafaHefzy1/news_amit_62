part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}


final class ChangeCurrentIndexState  extends NewsState {}


final class GetNewsModelSuccessState extends NewsState {}
final class GetNewsModelFailedState extends NewsState {}



final class ChangeLangSuccessState extends NewsState {}


final class ChageThemeApp extends NewsState {}
