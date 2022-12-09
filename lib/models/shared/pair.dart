class Pair<T, K> {
  final T item1;
  final K item2;

  const Pair({
    required this.item1,
    required this.item2,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pair && runtimeType == other.runtimeType && item1 == other.item1;

  @override
  int get hashCode => item1.hashCode;
}
