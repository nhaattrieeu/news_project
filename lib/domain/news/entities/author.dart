import 'package:equatable/equatable.dart';

class Author extends Equatable {
  final String fullName;
  final String avatar;

  const Author({required this.fullName, required this.avatar});

  @override
  List<Object> get props => [fullName, avatar];
}
