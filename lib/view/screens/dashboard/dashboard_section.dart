import 'package:flutter/material.dart';
import 'package:kabaten/business/users/users_view_model.dart';
import 'package:kabaten/models/user/user_model.dart';
import 'package:kabaten/view/builders/crud_items_builder.dart';
import 'package:kabaten/view/screens/dashboard/users_items.dart';
import 'package:provider/provider.dart';

class DashboardSection extends StatelessWidget {
  const DashboardSection({super.key});

  @override
  Widget build(BuildContext context) =>
      CrudItemsBuilder<UsersViewModel, UserModel>(
        builder: (_, __) => UsersItems(
          items: context.watch<UsersViewModel>().items,
        ),
      );
}
