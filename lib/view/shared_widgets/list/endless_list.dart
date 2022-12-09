import 'package:flutter/material.dart';
import 'package:kabaten/view/shared_widgets/center_progress.dart';

class EndlessList extends StatelessWidget {
  final List<dynamic> items;
  final Widget Function(BuildContext context, int index) itemBuilder;
  final Axis scrollDirection;
  final bool shrinkWrap;
  final ScrollController? scrollController;
  final ScrollPhysics? physics;
  final Function()? onLastItem;

  const EndlessList({
    Key? key,
    required this.items,
    required this.itemBuilder,
    this.scrollDirection = Axis.vertical,
    this.shrinkWrap = false,
    this.scrollController,
    this.physics,
    this.onLastItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => ListView.builder(
        itemCount: items.length + (items.isEmpty ? 0 : 1),
        itemBuilder: (context, index) {
          final length = items.length;

          if (length == 0) {
            return const SizedBox.shrink();
          }

          if (index == length) {
            onLastItem?.call();

            return const CenterProgress();
          }

          return itemBuilder.call(context, index);
        },
        scrollDirection: scrollDirection,
        controller: scrollController,
        shrinkWrap: shrinkWrap,
        physics: physics,
      );
}
