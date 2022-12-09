import 'package:kabaten/business/shared/base_view_model.dart';
import 'package:kabaten/business/shared/crud/crud_repository.dart';
import 'package:kabaten/business/shared/view_model_exception.dart';
import 'package:kabaten/models/map_model.dart';

abstract class CrudViewModel<T extends MapModel> extends BaseViewModel {
  final String api;
  final T Function(Map<String, dynamic> map) convertor;
  final bool mocked;

  T? item;

  late final CrudRepository<T> _repository;

  CrudViewModel({
    required this.api,
    required this.convertor,
    this.mocked = false,
  }) {
    _repository = CrudRepository(
      api: api,
      convertor: convertor,
      mocked: mocked,
    );
  }

  Future<T> retrieve({
    Map<String, dynamic>? parameters,
    bool loading = true,
  }) async {
    if (loading) {
      start();
    }

    try {
      item = await _repository.retrieve();

      notifyListeners();

      return item!;
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
        this.item = item;

        notifyListeners();
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
        this.item = item;

        notifyListeners();
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
        item = null;

        notifyListeners();
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
