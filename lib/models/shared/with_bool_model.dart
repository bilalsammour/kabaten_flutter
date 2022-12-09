class WithBoolModel<T> {
  final T item;
  bool checked = false;

  WithBoolModel({
    required this.item,
    this.checked = false,
  });
}
