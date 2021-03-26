// To parse this JSON data, do
//
//     final blogDetails = blogDetailsFromMap(jsonString);

import 'dart:convert';

BlogDetails blogDetailsFromMap(String str) => BlogDetails.fromMap(json.decode(str));

String blogDetailsToMap(BlogDetails data) => json.encode(data.toMap());

class BlogDetails {
  BlogDetails({
    this.id,
    this.createdAt,
    this.title,
    this.imageUrl,
  });

  final String id;
  final DateTime createdAt;
  final String title;
  final String imageUrl;

  factory BlogDetails.fromMap(Map<String, dynamic> json) => BlogDetails(
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
