import 'package:flutter/material.dart';
import 'package:kabaten/models/user/user_model.dart';
import 'package:kabaten/view/screens/dashboard/user_item.dart';
import 'package:kabaten/view/shared_widgets/list/generic_list.dart';

class UsersItems extends StatelessWidget {
  final List<UserModel> items;

  const UsersItems({
    super.key,
    required this.items,
  });

  @override
  Widget build(BuildContext context) => GenericList<UserModel>(
        items: items,
        itemBuilder: (_, index) => UserItem(item: items[index]),
      );
}
