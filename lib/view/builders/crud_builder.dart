import 'package:flutter/material.dart';
import 'package:kabaten/business/shared/crud/crud_view_model.dart';
import 'package:kabaten/business/shared/view_model_exception.dart';
import 'package:kabaten/models/map_model.dart';
import 'package:kabaten/view/shared_widgets/app_consumer.dart';
import 'package:kabaten/view/shared_widgets/center_progress.dart';
import 'package:kabaten/view/utils/dialogs_manager.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class CrudBuilder<V extends CrudViewModel<T>, T extends MapModel>
    extends SingleChildStatefulWidget {
  final Widget Function(
    BuildContext context,
    T item,
  ) builder;
  final Widget busyWidget;
  final Function(ViewModelException e)? onError;

  const CrudBuilder({
    Key? key,
    required this.builder,
    this.busyWidget = const CenterProgress(),
    this.onError,
  }) : super(key: key);

  @override
  State<CrudBuilder> createState() => _CrudBuilderState<V, T>();
}

class _CrudBuilderState<V extends CrudViewModel<T>, T extends MapModel>
    extends SingleChildState<CrudBuilder<V, T>> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      Duration.zero,
      () {
        try {
          context.read<V>().retrieve().then((_) => {});
        } on ViewModelException catch (e) {
          widget.onError?.call(e);
        } on Exception catch (e) {
          DialogsManager.showOkDialog(
            context: context,
            message: e.toString(),
          );
        }
      },
    );
  }

  @override
  Widget buildWithChild(BuildContext context, Widget? child) => AppConsumer<V>(
        builder: (_, value) => value.item == null
            ? widget.busyWidget
            : widget.builder(context, value.item!),
        busyWidget: widget.busyWidget,
      );
}
