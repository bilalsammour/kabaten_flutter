import 'package:kabaten/models/map_model.dart';
import 'package:kabaten/models/shared/id_name_model.dart';

class IdNameParentModel extends MapModel {
  static const String countKey = 'count';
  static const String nextKey = 'next';
  static const String previousKey = 'previous';
  static const String resultsKey = 'results';

  final String count;
  final String next;
  final String previous;
  final List<IdNameModel> results;

  const IdNameParentModel({
    this.count = '',
    this.next = '',
    this.previous = '',
    this.results = const [],
  });

  IdNameParentModel copyWith({
    String? count,
    String? next,
    String? previous,
    List<IdNameModel>? results,
  }) {
    return IdNameParentModel(
      count: count ?? this.count,
      next: next ?? this.next,
      previous: previous ?? this.previous,
      results: results ?? this.results,
    );
  }

  factory IdNameParentModel.fromMap(Map<String, dynamic> map) {
    return IdNameParentModel(
      count: (map[countKey] ?? '') as String,
      next: (map[nextKey] ?? '') as String,
      previous: (map[previousKey] ?? '') as String,
      results: List<IdNameModel>.from(
        (map[resultsKey] as List<dynamic>).map<IdNameModel>(
          (x) => IdNameModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
