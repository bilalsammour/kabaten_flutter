import 'package:kabaten/generated/l10n.dart';
import 'package:flutter/material.dart';

class NoItems extends StatelessWidget {
  const NoItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Center(
        child: Text(
          S.current.noItems,
          style: Theme.of(context).textTheme.headline3,
        ),
      );
}
