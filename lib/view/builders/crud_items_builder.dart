import 'package:flutter/material.dart';
import 'package:kabaten/business/shared/crud/crud_items_view_model.dart';
import 'package:kabaten/business/shared/view_model_exception.dart';
import 'package:kabaten/models/map_model.dart';
import 'package:kabaten/view/shared_widgets/app_consumer.dart';
import 'package:kabaten/view/shared_widgets/center_progress.dart';
import 'package:kabaten/view/utils/dialogs_manager.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

class CrudItemsBuilder<V extends CrudItemsViewModel<T>, T extends MapModel>
    extends SingleChildStatefulWidget {
  final Widget Function(
    BuildContext context,
    List<T> value,
  ) builder;
  final Widget busyWidget;
  final Function(ViewModelException e)? onError;

  const CrudItemsBuilder({
    Key? key,
    required this.builder,
    this.busyWidget = const CenterProgress(),
    this.onError,
  }) : super(key: key);

  @override
  State<CrudItemsBuilder> createState() => _CrudItemsBuilderState<V, T>();
}

class _CrudItemsBuilderState<V extends CrudItemsViewModel<T>,
    T extends MapModel> extends SingleChildState<CrudItemsBuilder<V, T>> {
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
        builder: (_, value) => widget.builder(context, value.items),
        busyWidget: widget.busyWidget,
      );
}
