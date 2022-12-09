import 'package:kabaten/business/shared/base_view_model.dart';
import 'package:kabaten/business/shared/crud/crud_items_repository.dart';
import 'package:kabaten/business/shared/view_model_exception.dart';
import 'package:kabaten/models/map_model.dart';

abstract class CrudItemsViewModel<T extends MapModel> extends BaseViewModel {
  final String api;
  final T Function(Map<String, dynamic> map) convertor;
  final bool mocked;

  final List<T> items = [];

  late final CrudItemsRepository<T> _repository;

  CrudItemsViewModel({
    required this.api,
    required this.convertor,
    this.mocked = false,
  }) {
    _repository = CrudItemsRepository(
      api: api,
      convertor: convertor,
      mocked: mocked,
    );
  }

  int get pageSize => 25;

  int page = 1;

  Future<List<T>> retrieve({
    List<String> suffix = const [],
    Map<String, dynamic>? parameters,
    bool loading = true,
  }) async {
    if (loading) {
      start();
    }

    try {
      final results = await _repository.retrieve(
        pageSize: pageSize,
        page: page,
        suffix: suffix,
        parameters: parameters,
      );

      if (results.isNotEmpty) {
        items.clear();
        items.addAll(results);
        notifyListeners();
      }

      return items;
    } on ViewModelException catch (e) {
      setError(e.error);

      rethrow;
    } finally {
      if (loading) {
        finish();
      }
    }
  }

  Future<void> insert({
    required T item,
    bool updateLocally = false,
    bool loading = false,
    bool refresh = false,
  }) async {
    if (loading) {
      start();
    }

    try {
      if (updateLocally) {
        try {
          items.add(item);

          notifyListeners();
        } on Exception catch (_) {}
      }

      await _repository.insert(item: item);

      if (refresh) {
        await retrieve(loading: false);
      }
    } on ViewModelException catch (e) {
      setError(e.error);

      rethrow;
    } finally {
      if (loading) {
        finish();
      }
    }
  }

  Future<void> update({
    required String id,
    required T item,
    bool updateLocally = false,
    bool loading = false,
    bool refresh = false,
  }) async {
    if (loading) {
      start();
    }

    try {
      if (updateLocally) {
        try {
          items[items.indexWhere(
            (element) => element.hashCode == id.hashCode,
          )] = item;

          notifyListeners();
        } on Exception catch (_) {}
      }

      await _repository.update(id: id, item: item);

      if (refresh) {
        await retrieve(loading: false);
      }
    } on ViewModelException catch (e) {
      setError(e.error);

      rethrow;
    } finally {
      if (loading) {
        finish();
      }
    }
  }

  Future<void> delete({
    required String id,
    bool updateLocally = false,
    bool loading = false,
    bool refresh = false,
  }) async {
    if (loading) {
      start();
    }

    try {
      if (updateLocally) {
        try {
          items.removeWhere(
            (element) => element.hashCode == id.hashCode,
          );

          notifyListeners();
        } on Exception catch (_) {}
      }

      await _repository.delete(id: id);

      if (refresh) {
        await retrieve(loading: false);
      }
    } on ViewModelException catch (e) {
      setError(e.error);

      rethrow;
    } finally {
      if (loading) {
        finish();
      }
    }
  }
}
