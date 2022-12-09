import 'package:kabaten/business/shared/crud/crud_items_view_model.dart';
import 'package:kabaten/models/user/user_model.dart';

class UsersViewModel extends CrudItemsViewModel<UserModel> {
  static const String _api = 'users-list';

  UsersViewModel()
      : super(
          api: _api,
          convertor: (map) => UserModel.fromMap(map),
        );
}
