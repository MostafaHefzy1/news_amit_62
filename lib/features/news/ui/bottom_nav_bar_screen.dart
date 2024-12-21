import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/base_widgets/custom_app_bar.dart';
import 'package:news_app/features/news/logic/news_cubit.dart';
import 'package:news_app/main.dart';

class BottomNavBarScreen extends StatelessWidget {
  const BottomNavBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        var cubit = NewsCubit.get(context);
        return Scaffold(
          appBar: CustomAppBar(title: "news".tr()),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.amber[900],
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (value) {
                cubit.changeCurrentIndex(value);
              },
              items: [
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.sports,
                    ),
                    label: "sports".tr()),
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.business,
                    ),
                    label: "business".tr()),
                BottomNavigationBarItem(
                    icon: const Icon(
                      Icons.science,
                    ),
                    label: "Science".tr())
              ]),
        );
      },
    );
  }
}
