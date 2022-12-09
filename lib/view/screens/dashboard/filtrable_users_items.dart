import 'package:flutter/material.dart';
import 'package:kabaten/generated/l10n.dart';
import 'package:kabaten/models/user/user_model.dart';
import 'package:kabaten/utils/keyboard_manager.dart';
import 'package:kabaten/view/resources/app_resources.dart';
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
          _buildSearch(),
          const SizedBox(height: AppDimensions.halfSpace),
          Expanded(
            child: UsersItems(
              items: _getFiltrableItems(),
              endless: _searchController.text.trim().isEmpty,
              onLastItem: widget.onLastItem,
            ),
          ),
        ],
      );

  Widget _buildSearch() => TextField(
        controller: _searchController,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          labelText: S.current.search,
          suffixIcon: IconButton(
            icon: const Icon(
              AppIcons.xmark,
            ),
            onPressed: () => _onClose(),
          ),
        ),
        onChanged: (value) {
          if (value.isEmpty) {
            setState(() {});
          }
        },
        onEditingComplete: () => _onSubmitSearch(),
      );

  void _onClose() {
    _searchController.clear();

    setState(() {});

    KeyboardManager.hideKeyboard(context);
  }

  void _onSubmitSearch() {
    setState(() {});

    KeyboardManager.hideKeyboard(context);
  }

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
