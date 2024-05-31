import 'package:equatable/equatable.dart';

class Author extends Equatable {
  final String id;
  final String fullName;
  final String avatar;
  final bool follow;

  const Author({
    required this.id,
    required this.fullName,
    required this.avatar,
    required this.follow,
  });

  Author copyWith({
    String? id,
    String? fullName,
    String? avatar,
    bool? follow,
  }) {
    return Author(
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      avatar: avatar ?? this.avatar,
      follow: follow ?? this.follow,
    );
  }

  @override
  List<Object> get props => [id, fullName, avatar, follow];
}
