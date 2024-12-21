import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:news_app/features/news/ui/widgets/change_lang.dart';
import 'package:news_app/features/news/ui/widgets/change_theme.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool isBack;
  const CustomAppBar({super.key, required this.title, this.isBack = false});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      // backgroundColor: Colors.amber[900],
      centerTitle: true,
      leading: isBack
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
              ))
          : const SizedBox(),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
      actions: [
        ChangeLangWidget(),
        ChangeThemeWidget()
      ],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(40.h);
}
