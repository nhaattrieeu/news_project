part of 'explore_cubit.dart';

enum ExploreStatus { init, loading, loaded, error }

final class ExploreState extends Equatable {
  final ExploreStatus status;
  final Explore explore;

  const ExploreState({required this.status, required this.explore});

  ExploreState copyWith({
    ExploreStatus? status,
    Explore? explore,
  }) {
    return ExploreState(
      status: status ?? this.status,
      explore: explore ?? this.explore,
    );
  }

  @override
  List<Object?> get props => [explore, status];
}
