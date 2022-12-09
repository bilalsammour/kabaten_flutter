import 'package:flutter/material.dart';
import 'package:kabaten/business/users/users_view_model.dart';
import 'package:kabaten/models/user/user_model.dart';
import 'package:kabaten/view/builders/crud_items_builder.dart';
import 'package:kabaten/view/resources/app_resources.dart';
import 'package:kabaten/view/screens/dashboard/filtrable_users_items.dart';
import 'package:provider/provider.dart';

class DashboardSection extends StatelessWidget {
  const DashboardSection({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDimensions.mainSpace,
        ),
        child: CrudItemsBuilder<UsersViewModel, UserModel>(
          builder: (_, __) => FiltrableUsersItems(
            items: context.watch<UsersViewModel>().items,
            onLastItem: () => context.read<UsersViewModel>().retrieve(
                  loading: false,
                ),
          ),
        ),
      );
}
