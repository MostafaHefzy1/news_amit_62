import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:news_app/app.dart';
import 'package:news_app/core/network/global/dio_helper.dart';
import 'package:news_app/core/network/local/sharedpref_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await SharedprefHelper.initSharedprefHelper();
  await DioHelper.initDioHelper();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );



  // runApp(const MyApp());
  runApp(EasyLocalization(
      supportedLocales: [const Locale('ar'), const Locale('en')],
      path:
          'assets/translations', // <-- change the path of the translation files
      fallbackLocale: const Locale('en', 'US'),
      child: Phoenix(
        child: MyApp(),
      )));
}
