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

  @override
  List<Object> get props => [id, title, image, createdAt, author];
}
