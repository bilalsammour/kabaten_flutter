import 'package:flutter/material.dart';
import 'package:kabaten/business/profile/profile_view_model.dart';
import 'package:kabaten/generated/l10n.dart';
import 'package:kabaten/models/user/user_model.dart';
import 'package:kabaten/view/builders/crud_builder.dart';
import 'package:kabaten/view/screens/profile/profile_content.dart';
import 'package:kabaten/view/shared_widgets/templates/main_template.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => MainTemplate(
        appBar: AppBar(
          title: Text(
            S.current.profile,
          ),
        ),
        child: CrudBuilder<ProfileViewModel, UserModel>(
          builder: (_, value) => ProfileContent(item: value),
        ),
      );
}
