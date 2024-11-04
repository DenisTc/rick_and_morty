extension NullableStringExtension on String? {
  bool get isNotNullOrEmpty => this?.isNotEmpty ?? false;
}
