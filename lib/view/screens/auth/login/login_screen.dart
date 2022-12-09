import 'package:flutter/material.dart';
import 'package:kabaten/view/screens/auth/login/login_content.dart';
import 'package:kabaten/view/shared_widgets/templates/app_bar/app_bar_transparent_template.dart';
import 'package:kabaten/view/shared_widgets/templates/main_template.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MainTemplate(
        appBar: AppBarTransparentTemplate(),
        child: LoginContent(),
      );
}
