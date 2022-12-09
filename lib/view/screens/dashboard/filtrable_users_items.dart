import 'package:flutter/material.dart';
import 'package:kabaten/generated/l10n.dart';
import 'package:kabaten/models/user/user_model.dart';
import 'package:kabaten/view/screens/dashboard/users_items.dart';

class FiltrableUsersItems extends StatefulWidget {
  final List<UserModel> items;
  final Function() onLastItem;

  const FiltrableUsersItems({
    super.key,
    required this.items,
    required this.onLastItem,
  });

  @override
  State<FiltrableUsersItems> createState() => _FiltrableUsersItemsState();
}

class _FiltrableUsersItemsState extends State<FiltrableUsersItems> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Column(
        children: [
          TextField(
            controller: _searchController,
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              labelText: S.current.search,
            ),
            onChanged: (value) {
              if (value.isEmpty) {
                setState(() {});
              }
            },
            onEditingComplete: () => setState(() {}),
          ),
          Expanded(
            child: UsersItems(
              items: _getFiltrableItems(),
              endless: _searchController.text.trim().isEmpty,
              onLastItem: widget.onLastItem,
            ),
          ),
        ],
      );

  List<UserModel> _getFiltrableItems() => _getFiltrableItemsWithQuery(
        _searchController.text.trim(),
      );

  List<UserModel> _getFiltrableItemsWithQuery(String query) => query.isEmpty
      ? widget.items
      : widget.items
          .where(
            (element) => element.filter(query),
          )
          .toList();
}
