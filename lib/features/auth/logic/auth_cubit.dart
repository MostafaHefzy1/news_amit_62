import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/network/local/sharedpref_helper.dart';
import 'package:news_app/features/news/ui/bottom_nav_bar_screen.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  static AuthCubit get(context) => BlocProvider.of(context);

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(context) {
    emit(LoginLoadingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      SharedprefHelper.saveData(key: "token", value: value.user!.uid);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => BottomNavBarScreen()));
      emit(LoginSuccessState());
    }).catchError((error) {
      emit(LoginFailedState());
    });
  }

  void register(context) {
    emit(RegisterLoadingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: emailController.text, password: passwordController.text)
        .then((value) {
      SharedprefHelper.saveData(key: "token", value: value.user!.uid);
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => BottomNavBarScreen()));
      emit(RegisterSuccessState());
    }).catchError((error) {
      emit(RegisterFailedState());
    });
  }
}
