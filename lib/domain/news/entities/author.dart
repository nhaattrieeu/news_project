import 'package:equatable/equatable.dart';

class Author extends Equatable {
  final String id;
  final String username;
  final String fullName;
  final String avatar;

  const Author({
    required this.id,
    required this.username,
    required this.fullName,
    required this.avatar,
  });

  @override
  List<Object> get props => [
        id,
        username,
        fullName,
        avatar,
      ];
}
