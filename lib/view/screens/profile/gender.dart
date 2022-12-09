import 'package:flutter/material.dart';
import 'package:kabaten/business/profile/profile_view_model.dart';
import 'package:kabaten/generated/l10n.dart';
import 'package:kabaten/models/shared/pair.dart';
import 'package:kabaten/view/resources/app_resources.dart';

class Gender extends StatefulWidget {
  final String initial;
  final Function(String value)? onChanged;

  const Gender({
    super.key,
    required this.initial,
    this.onChanged,
  });

  @override
  State<Gender> createState() => _GenderState();
}

class _GenderState extends State<Gender> {
  late String _value;

  @override
  void initState() {
    super.initState();

    _value = widget.initial;
  }

  @override
  Widget build(BuildContext context) => InputDecorator(
        decoration: InputDecoration(
          labelText: S.current.gender,
          border: InputBorder.none,
        ),
        child: _buildItems(context),
      );

  Widget _buildItems(BuildContext context) => Column(
        children: ProfileViewModel.source
            .map(
              (e) => _buildItem(
                context,
                item: e,
              ),
            )
            .toList(),
      );

  Widget _buildItem(
    BuildContext context, {
    required Pair<String, String> item,
  }) =>
      RadioListTile<String>(
        dense: true,
        contentPadding: EdgeInsets.zero,
        title: Text(
          item.item2,
          style: AppStyles.p1(context),
        ),
        value: item.item1,
        groupValue: _value,
        onChanged: (value) => _onChanged(
          context,
          value: value,
        ),
      );

  void _onChanged(
    BuildContext context, {
    required String? value,
  }) {
    setState(() => _value = value ?? '');

    widget.onChanged?.call(_value);
  }
}
