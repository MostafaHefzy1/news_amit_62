import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/core/network/local/sharedpref_helper.dart';
import 'package:news_app/core/theming/theme.dart';
import 'package:news_app/features/auth/logic/auth_cubit.dart';
import 'package:news_app/features/auth/ui/login_screen.dart';
import 'package:news_app/features/news/logic/news_cubit.dart';
import 'package:news_app/features/news/ui/bottom_nav_bar_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // context.setLocale(Locale('en'));

    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (BuildContext context) => AuthCubit(),
            ),
            BlocProvider(
              create: (BuildContext context) =>
                  NewsCubit()..getNews(catogery: "sports"),
            ),
          ],
          child: BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              var cubit = NewsCubit.get(context);
              return MaterialApp(
                  localizationsDelegates: context.localizationDelegates,
                  supportedLocales: context.supportedLocales,
                  locale: context.locale,
                  // theme: ThemeData(
                  //     appBarTheme:
                  //         AppBarTheme(backgroundColor: Colors.amber[900]),
                  //     textTheme: const TextTheme(
                  //       titleMedium: TextStyle(
                  //           color: Colors.black,
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.w500),
                  //       bodyMedium: TextStyle(
                  //         color: Colors.black,
                  //         fontSize: 14,
                  //       ),
                  //       displayMedium: TextStyle(
                  //           color: Colors.grey,
                  //           fontSize: 12,
                  //           fontWeight: FontWeight.w500),
                  //     )),
                  // darkTheme: ThemeData(
                  //     appBarTheme:
                  //         const AppBarTheme(backgroundColor: Colors.black),
                  //     scaffoldBackgroundColor: Colors.black54,
                  //     bottomNavigationBarTheme:
                  //         const BottomNavigationBarThemeData(
                  //       backgroundColor: Colors.black,
                  //       unselectedItemColor: Colors.white,
                  //     ),
                  //     textTheme: const TextTheme(
                  //       titleMedium: TextStyle(
                  //           color: Colors.white,
                  //           fontSize: 18,
                  //           fontWeight: FontWeight.w500),
                  //       bodyMedium: TextStyle(
                  //         color: Colors.white,
                  //         fontSize: 14,
                  //       ),
                  //       displayMedium: TextStyle(
                  //           color: Colors.grey,
                  //           fontSize: 12,
                  //           fontWeight: FontWeight.w500),
                  //     )),
                  theme: lightTheme(),
                  darkTheme: darkTheme(),
                  themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
                  debugShowCheckedModeBanner: false,
                  home: SharedprefHelper.getData(key: "token") == null
                      ? LoginScreen()
                      : const BottomNavBarScreen());
            },
          ),
        );
      },
    );
  }
}
