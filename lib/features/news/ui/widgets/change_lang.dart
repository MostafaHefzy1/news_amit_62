import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:news_app/core/network/local/sharedpref_helper.dart';
import 'package:news_app/features/news/logic/news_cubit.dart';

class ChangeLangWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          if (context.locale.toString() == "en") {
            context.setLocale(const Locale('ar'));
            SharedprefHelper.saveData(key: "lang", value: "ar");
          } else {
            context.setLocale(const Locale('en'));
            SharedprefHelper.saveData(key: "lang", value: "en");
          }
          Phoenix.rebirth(context);
        },
        icon: const Icon(
          Icons.language,
          color: Colors.white,
        ));
  }
}
