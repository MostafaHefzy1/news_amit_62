import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/base_widgets/custom_article.dart';
import 'package:news_app/features/news/logic/news_cubit.dart';

class SportsScreen extends StatelessWidget {
  const SportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          body: cubit.newsModel == null
              ? LinearProgressIndicator(
                  color: Colors.amber[900],
                )
              : ListView.builder(
                  itemBuilder: (context, index) => CustomArticle(
                        articles: cubit.newsModel!.articles![index],
                      ),
                  itemCount: cubit.newsModel!.articles!.length),
        );
      },
    );
  }
}
