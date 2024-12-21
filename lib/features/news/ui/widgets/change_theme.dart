import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/features/news/logic/news_cubit.dart';

class ChangeThemeWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        return IconButton(
            onPressed: () {
              NewsCubit.get(context).changeTheme() ; 
            },
            icon: const Icon(
              Icons.dark_mode,
              color: Colors.white,
            ));
      },
    );
  }
}
