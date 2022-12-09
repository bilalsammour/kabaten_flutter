import 'package:flutter/material.dart';
import 'package:kabaten/view/resources/app_resources.dart';

class UserSectionItem extends StatelessWidget {
  final String label;
  final Function()? onPressed;

  const UserSectionItem({
    Key? key,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(
          left: AppDimensions.mainSpace,
          right: AppDimensions.mainSpace,
          bottom: AppDimensions.quarterSpace,
        ),
        child: Card(
          elevation: AppDimensions.largeElevation,
          child: ListTile(
            onTap: () => onPressed?.call(),
            title: Text(
              label,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
        ),
      );
}
