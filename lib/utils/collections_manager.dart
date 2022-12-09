class CollectionsManager {
  static Map<T, List<S>> groupBy<T, S>(
    Iterable<S> values,
    T Function(S) key,
  ) {
    final map = <T, List<S>>{};

    for (final element in values) {
      (map[key(element)] ??= []).add(element);
    }

    return map;
  }
}
