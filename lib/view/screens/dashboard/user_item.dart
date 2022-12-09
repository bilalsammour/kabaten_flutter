import 'package:flutter/material.dart';
import 'package:kabaten/models/user/user_model.dart';
import 'package:kabaten/view/resources/app_resources.dart';

class UserItem extends StatelessWidget {
  final UserModel item;

  const UserItem({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.mainSpace,
          vertical: AppDimensions.quarterSpace,
        ),
        child: Card(
          elevation: AppDimensions.largeElevation,
          child: ListTile(
            title: Text(
              item.title,
            ),
          ),
        ),
      );
}
