import 'package:kabaten/view/resources/app_resources.dart';
import 'package:kabaten/view/shared_widgets/no_items.dart';
import 'package:flutter/material.dart';

class GenericGridView<T> extends StatelessWidget {
  final List<T> items;
  final IndexedWidgetBuilder itemBuilder;

  const GenericGridView({
    Key? key,
    required this.items,
    required this.itemBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      items.isEmpty ? const NoItems() : _buildGridView(context);

  Widget _buildGridView(BuildContext context) => GridView.builder(
        itemCount: items.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: _buildCrossAxisCount(context),
          crossAxisSpacing: AppDimensions.halfSpace,
          mainAxisSpacing: AppDimensions.halfSpace,
          childAspectRatio: 2.0,
        ),
        itemBuilder: itemBuilder,
      );

  int _buildCrossAxisCount(BuildContext context) =>
      MediaQuery.of(context).orientation == Orientation.landscape ? 3 : 2;
}
