import 'package:flutter/material.dart';
import 'package:kabaten/view/screens/auth/verification/verification_content.dart';
import 'package:kabaten/view/shared_widgets/templates/app_bar/app_bar_transparent_template.dart';
import 'package:kabaten/view/shared_widgets/templates/main_template.dart';

class VerificationScreen extends StatelessWidget {
  const VerificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => const MainTemplate(
        appBar: AppBarTransparentTemplate(),
        child: VerificationContent(),
      );
}
