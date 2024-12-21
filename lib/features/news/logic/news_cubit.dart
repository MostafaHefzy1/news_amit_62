import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/model/news_model.dart';
import 'package:news_app/core/network/global/dio_helper.dart';
import 'package:news_app/core/network/local/sharedpref_helper.dart';
import 'package:news_app/features/news/ui/news_screen/business_screen.dart';
import 'package:news_app/features/news/ui/news_screen/science_screen.dart';
import 'package:news_app/features/news/ui/news_screen/sports_screen.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());
  static NewsCubit get(context) => BlocProvider.of(context);
  List<Widget> screens = [
    const SportsScreen(),
    BusinessScreen(),
    const ScienceScreen()
  ];

  int currentIndex = 0;
  void changeCurrentIndex(int index) {
    currentIndex = index;
    if (currentIndex == 0) {
      getNews(catogery: "sports");
    } else if (currentIndex == 1) {
      getNews(catogery: "business");
    } else {
      getNews(catogery: "science");
    }
    emit(ChangeCurrentIndexState());
  }

  NewsModel? newsModel;
  void getNews({required String catogery}) {
    DioHelper.getData(endpoint: "everything", queryParameters: {
      "language": SharedprefHelper.getData(key: "lang") ?? "ar",
      "q": catogery,
      "apiKey": "9bea17d1ed014375a4156ef51c6a8abe"
    }).then((value) {
      newsModel = NewsModel.fromJson(value.data);
      emit(GetNewsModelSuccessState());
    }).catchError((error) {
      emit(GetNewsModelFailedState());
    });
  }


  bool isDark = SharedprefHelper.getData(key: "isDark") ?? false;
  changeTheme() {
    isDark = !isDark;
    SharedprefHelper.saveData(key: "isDark", value: isDark);
    emit(ChageThemeApp());
  }
}
