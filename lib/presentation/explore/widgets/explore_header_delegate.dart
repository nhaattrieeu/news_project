import 'package:flutter/cupertino.dart';
import 'package:news_project/core/constants/colors.dart';
import 'package:news_project/presentation/explore/widgets/explore_header.dart';

class ExploreHeaderDelegate extends SliverPersistentHeaderDelegate {
  ExploreHeaderDelegate(this.title);

  final String title;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: kWhiteColor,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ExploreHeader(title: title),
    );
  }

  @override
  double get maxExtent => 56;

  @override
  double get minExtent => 56;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
