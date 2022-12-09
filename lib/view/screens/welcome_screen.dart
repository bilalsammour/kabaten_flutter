import 'package:flutter/material.dart';
import 'package:kabaten/business/auth/auth_view_model.dart';
import 'package:kabaten/view/screens/auth/login/login_screen.dart';
import 'package:kabaten/view/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => context.read<AuthViewModel>().hasToken()
      ? const HomeScreen()
      : const LoginScreen();
}
