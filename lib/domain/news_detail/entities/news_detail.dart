import 'package:equatable/equatable.dart';

import 'author_detail.dart';

class NewsDetail extends Equatable {
  final String id;
  final String title;
  final String content;
  final String image;
  final AuthorDetail author;
  final bool love;
  final bool bookmark;
  final int numOfLove;
  final int numOfComment;
  final int createdAt;

  const NewsDetail({
    required this.id,
    required this.title,
    required this.content,
    required this.image,
    required this.author,
    required this.love,
    required this.bookmark,
    required this.numOfLove,
    required this.numOfComment,
    required this.createdAt,
  });

  NewsDetail copyWith({
    String? id,
    String? title,
    String? content,
    String? image,
    AuthorDetail? author,
    bool? love,
    bool? bookmark,
    int? numOfLove,
    int? numOfComment,
    int? createdAt,
  }) {
    return NewsDetail(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      image: image ?? this.image,
      author: author ?? this.author,
      love: love ?? this.love,
      bookmark: bookmark ?? this.bookmark,
      numOfLove: numOfLove ?? this.numOfLove,
      numOfComment: numOfComment ?? this.numOfComment,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  static const empty = NewsDetail(
    id: "",
    title: "",
    content: "",
    image: "",
    author: AuthorDetail.empty,
    love: false,
    bookmark: false,
    numOfLove: 0,
    numOfComment: 0,
    createdAt: 0,
  );

  @override
  List<Object> get props => [
        id,
        title,
        content,
        image,
        author,
        love,
        bookmark,
        numOfLove,
        numOfComment,
        createdAt,
      ];
}
