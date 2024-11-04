class Info {
  final int pages;
  final String? next;

  Info({required this.pages, this.next});

  factory Info.fromJson(Map<String, dynamic> json) {
    return Info(
      pages: json['pages'],
      next: json['next'],
    );
  }
}
