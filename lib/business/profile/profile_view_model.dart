import 'package:kabaten/business/shared/crud/crud_view_model.dart';
import 'package:kabaten/generated/l10n.dart';
import 'package:kabaten/models/shared/pair.dart';
import 'package:kabaten/models/user/user_model.dart';

class ProfileViewModel extends CrudViewModel<UserModel> {
  static const String _api = 'user';

  static final source = [
    Pair<String, String>(
      item1: '1',
      item2: S.current.male,
    ),
    Pair<String, String>(
      item1: '2',
      item2: S.current.female,
    ),
  ];

  ProfileViewModel()
      : super(
          api: _api,
          convertor: (map) => UserModel.fromMap(map),
        );
}
