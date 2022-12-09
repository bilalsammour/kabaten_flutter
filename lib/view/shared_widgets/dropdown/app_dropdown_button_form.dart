import 'package:flutter/material.dart';
import 'package:kabaten/generated/l10n.dart';

class AppDropdownButtonForm<T> extends StatefulWidget {
  final String labelText;
  final List<T> items;
  final DropdownMenuItem<T> Function(T value) convertItem;
  final T? defaultItem;
  final Widget? hint;
  final bool withItemAll;
  final bool isDense;
  final bool isExpanded;
  final FormFieldValidator<T>? validator;
  final void Function(T? value)? onChanged;

  const AppDropdownButtonForm({
    Key? key,
    required this.labelText,
    required this.items,
    required this.convertItem,
    this.defaultItem,
    this.hint,
    this.withItemAll = true,
    this.isDense = true,
    this.isExpanded = false,
    this.validator,
    this.onChanged,
  }) : super(key: key);

  @override
  State<AppDropdownButtonForm<T>> createState() =>
      _AppDropdownButtonFormState<T>();
}

class _AppDropdownButtonFormState<T> extends State<AppDropdownButtonForm<T>> {
  T? _selectedItem;

  @override
  void initState() {
    super.initState();

    _selectedItem = widget.defaultItem;
  }

  @override
  Widget build(BuildContext context) => DropdownButtonFormField<T>(
        decoration: InputDecoration(
          labelText: widget.labelText,
        ),
        hint: widget.hint,
        isDense: widget.isDense,
        isExpanded: widget.isExpanded,
        items: _items,
        value: _getSelectedItem(),
        validator: widget.validator,
        onChanged: (value) {
          setState(() => _selectedItem = value);

          widget.onChanged?.call(value);
        },
      );

  List<DropdownMenuItem<T>> get _items => widget.withItemAll
      ? [
          _itemAll,
          ..._sourceItems,
        ]
      : _sourceItems;

  List<DropdownMenuItem<T>> get _sourceItems => widget.items
      .map(
        (e) => widget.convertItem(e),
      )
      .toList();

  DropdownMenuItem<T> get _itemAll => DropdownMenuItem<T>(
        value: null,
        child: Text(
          S.current.all,
        ),
      );

  T? _getSelectedItem() {
    try {
      return _selectedItem;
    } catch (_) {
      return null;
    }
  }
}
