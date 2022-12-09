import 'package:kabaten/models/map_model.dart';

class ItemParentModel extends MapModel {
  final String status;
  final String messageKey;
  final String message;
  final Map<String, dynamic> data;
  final Map<String, dynamic> meta;

  const ItemParentModel({
    this.status = '',
    this.messageKey = '',
    this.message = '',
    this.data = const {},
    this.meta = const {},
  });

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'status': status,
      'message_key': messageKey,
      'message': message,
      'data': data,
      'meta': meta,
    };
  }

  factory ItemParentModel.fromMap(Map<String, dynamic> map) => ItemParentModel(
        status: (map['status'] ?? '') as String,
        messageKey: (map['message_key'] ?? '') as String,
        message: (map['message'] ?? '') as String,
        data: Map<String, dynamic>.from(
          (map['data'] ?? const <Map<String, dynamic>>{})
              as Map<String, dynamic>,
        ),
        meta: Map<String, dynamic>.from(
          (map['meta'] ?? const <Map<String, dynamic>>{})
              as Map<String, dynamic>,
        ),
      );

  T getParsedResults<T>(
    T Function(Map<String, dynamic> map) convertor,
  ) =>
      convertor.call(data);
}
