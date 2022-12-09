import 'package:flutter/material.dart';
import 'package:kabaten/generated/l10n.dart';
import 'package:kabaten/utils/navigation_manager.dart';
import 'package:kabaten/view/resources/app_resources.dart';
import 'package:kabaten/view/screens/auth/login/login_screen.dart';
import 'package:kabaten/view/screens/profile/profile_screen.dart';
import 'package:kabaten/view/screens/user/user_section_item.dart';

class UserSection extends StatelessWidget {
  const UserSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          vertical: AppDimensions.mainSpace,
        ),
        child: Column(
          children: [
            UserSectionItem(
              label: S.current.profile,
              onPressed: () => NavigationManager.push(
                context,
                const ProfileScreen(),
              ),
            ),
            const Divider(),
            UserSectionItem(
              label: S.current.logout,
              onPressed: () => NavigationManager.pushClearBack(
                context,
                const LoginScreen(),
              ),
            ),
          ],
        ),
      );
}
