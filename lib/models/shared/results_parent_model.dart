import 'package:kabaten/models/map_model.dart';
import 'package:kabaten/models/shared/results_meta_model.dart';

class ResultsParentModel extends MapModel {
  final String status;
  final String messageKey;
  final String message;
  final List<Map<String, dynamic>> data;
  final ResultsMetaModel meta;

  const ResultsParentModel({
    this.status = '',
    this.messageKey = '',
    this.message = '',
    this.data = const [],
    this.meta = const ResultsMetaModel(),
  });

  factory ResultsParentModel.fromMap(Map<String, dynamic> map) {
    return ResultsParentModel(
      status: (map['status'] ?? '') as String,
      messageKey: (map['message_key'] ?? '') as String,
      message: (map['message'] ?? '') as String,
      data: List<Map<String, dynamic>>.from(
        (map['data'] as List<dynamic>).map(
          (e) => e as Map<String, dynamic>,
        ),
      ),
      meta: ResultsMetaModel.fromMap(map['meta'] as Map<String, dynamic>),
    );
  }

  List<T> getParsedResults<T>(
    T Function(Map<String, dynamic> map) convertor,
  ) =>
      data
          .map(
            (e) => convertor.call(e),
          )
          .toList();
}
