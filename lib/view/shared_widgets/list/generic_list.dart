import 'package:kabaten/view/shared_widgets/no_items.dart';
import 'package:flutter/material.dart';

class GenericList<T> extends StatelessWidget {
  final List<T> items;
  final IndexedWidgetBuilder itemBuilder;
  final Axis scrollDirection;
  final bool shrinkWrap;
  final ScrollController? scrollController;
  final ScrollPhysics? scrollPhysics;

  const GenericList({
    Key? key,
    required this.items,
    required this.itemBuilder,
    this.scrollDirection = Axis.vertical,
    this.shrinkWrap = false,
    this.scrollController,
    this.scrollPhysics,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => items.isEmpty
      ? const NoItems()
      : ListView.builder(
          itemCount: items.length,
          itemBuilder: itemBuilder,
          scrollDirection: scrollDirection,
          controller: scrollController,
          shrinkWrap: shrinkWrap,
          physics: scrollPhysics,
        );
}
