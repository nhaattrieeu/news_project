import 'package:equatable/equatable.dart';

import 'author.dart';

class News extends Equatable {
  final String id;
  final String title;
  final String image;
  final int createdAt;
  final Author author;

  const News({
    required this.id,
    required this.title,
    required this.image,
    required this.createdAt,
    required this.author,
  });

  static const empty = News(
    id: "",
    title: "",
    image: "",
    createdAt: 0,
    author: Author(
      id: "",
      username: "",
      fullName: "",
      avatar: "",
    ),
  );

  @override
  List<Object> get props => [id, title, image, createdAt, author];
}
