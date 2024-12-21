import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/base_widgets/custom_app_bar.dart';
import 'package:news_app/core/base_widgets/custom_button.dart';
import 'package:news_app/core/base_widgets/custom_text_form_filed.dart';
import 'package:news_app/core/base_widgets/spacing.dart';
import 'package:news_app/features/auth/logic/auth_cubit.dart';
import 'package:news_app/features/auth/ui/register_screen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          var cubit = AuthCubit.get(context);
          return Scaffold(
            appBar: const CustomAppBar(title: "Login Screen"),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  verticleSpace(10),
                  CustomTextFormFiled(
                      hintText: "Email",
                      prefixIcon: Icons.email_outlined,
                      validator: () {},
                      controller: cubit.emailController),
                  verticleSpace(5),
                  CustomTextFormFiled(
                      hintText: "Password",
                      prefixIcon: Icons.lock_open_outlined,
                      validator: () {},
                      controller: cubit.passwordController),
                  verticleSpace(30),
                  CustomButton(
                      loading: state is LoginLoadingState,
                      text: "LognIn",
                      function: () {
                        cubit.login(context);
                      }),
                  verticleSpace(10),
                  Text.rich(TextSpan(text: "Create New Account? ", children: [
                    TextSpan(
                        text: "Click Here",
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => RegisterScreen()));
                          },
                        style: TextStyle(
                          color: Colors.amber[900],
                        ))
                  ]))
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
