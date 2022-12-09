import 'package:kabaten/models/map_model.dart';

class ResultsMetaModel extends MapModel {
  final int page;
  final int pageSize;
  final int totalRecords;
  final int totalPages;
  final int? next;
  final int? previous;

  const ResultsMetaModel({
    this.page = 0,
    this.pageSize = 0,
    this.totalRecords = 0,
    this.totalPages = 0,
    this.next,
    this.previous,
  });

  factory ResultsMetaModel.fromMap(Map<String, dynamic> map) {
    return ResultsMetaModel(
      page: (map['page'] ?? 0) as int,
      pageSize: (map['page_size'] ?? 0) as int,
      totalRecords: (map['total_records'] ?? 0) as int,
      totalPages: (map['total_pages'] ?? 0) as int,
      next: map['next'] != null ? map['next'] as int : null,
      previous: map['previous'] != null ? map['previous'] as int : null,
    );
  }
}
