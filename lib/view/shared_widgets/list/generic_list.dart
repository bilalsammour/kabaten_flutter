import 'package:kabaten/view/shared_widgets/list/endless_list.dart';
import 'package:kabaten/view/shared_widgets/no_items.dart';
import 'package:flutter/material.dart';

class GenericList extends StatelessWidget {
  final List<dynamic> items;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final bool endless;
  final Axis scrollDirection;
  final bool shrinkWrap;
  final ScrollController? scrollController;
  final ScrollPhysics? physics;
  final Function()? onLastItem;

  const GenericList({
    Key? key,
    required this.items,
    required this.itemBuilder,
    this.endless = false,
    this.scrollDirection = Axis.vertical,
    this.shrinkWrap = false,
    this.scrollController,
    this.physics,
    this.onLastItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => items.isEmpty
      ? const NoItems()
      : EndlessList(
          items: items,
          itemBuilder: itemBuilder,
          endless: endless,
          scrollDirection: scrollDirection,
          shrinkWrap: shrinkWrap,
          physics: physics,
          onLastItem: onLastItem,
        );
}
