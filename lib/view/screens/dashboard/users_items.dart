import 'package:flutter/material.dart';
import 'package:kabaten/models/user/user_model.dart';
import 'package:kabaten/view/screens/dashboard/user_item.dart';
import 'package:kabaten/view/shared_widgets/list/generic_list.dart';

class UsersItems extends StatelessWidget {
  final List<UserModel> items;
  final bool endless;
  final Function() onLastItem;

  const UsersItems({
    super.key,
    required this.items,
    required this.endless,
    required this.onLastItem,
  });

  @override
  Widget build(BuildContext context) => GenericList(
        items: items,
        endless: endless,
        itemBuilder: (_, index) => UserItem(
          item: items[index],
        ),
        onLastItem: () => onLastItem.call(),
      );
}
