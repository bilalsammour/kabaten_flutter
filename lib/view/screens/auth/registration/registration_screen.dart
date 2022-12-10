import 'package:flutter/material.dart';
import 'package:kabaten/view/screens/auth/registration/registration_content.dart';
import 'package:kabaten/view/shared_widgets/templates/app_bar/app_bar_transparent_template.dart';
import 'package:kabaten/view/shared_widgets/templates/main_template.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MainTemplate(
        appBar: AppBarTransparentTemplate(),
        child: RegistrationContent(),
      );
}
