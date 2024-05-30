import 'package:equatable/equatable.dart';

class AuthorDetail extends Equatable {
  final String id;
  final String username;
  final String fullName;
  final String avatar;
  final bool follow;

  const AuthorDetail({
    required this.id,
    required this.username,
    required this.fullName,
    required this.avatar,
    required this.follow,
  });

  AuthorDetail copyWith({
    String? id,
    String? username,
    String? fullName,
    String? avatar,
    bool? follow,
  }) {
    return AuthorDetail(
      id: id ?? this.id,
      username: username ?? this.username,
      fullName: fullName ?? this.fullName,
      avatar: avatar ?? this.avatar,
      follow: follow ?? this.follow,
    );
  }

  static const empty = AuthorDetail(
    id: "",
    username: "",
    fullName: "",
    avatar: "",
    follow: false,
  );

  @override
  List<Object> get props => [
        id,
        username,
        fullName,
        avatar,
        follow,
      ];
}
