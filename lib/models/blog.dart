class Blog {
  Blog({
    this.id,
    this.createdAt,
    this.title,
    this.imageUrl,
  });

  final String id;
  final DateTime createdAt;
  final String title;
  final String imageUrl;

  factory Blog.fromMap(Map<String, dynamic> json) => Blog(
        id: json["id"],
        createdAt: DateTime.parse(json["createdAt"]),
        title: json["title"],
        imageUrl: json["imageUrl"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "createdAt": createdAt.toIso8601String(),
        "title": title,
        "imageUrl": imageUrl,
      };
}
