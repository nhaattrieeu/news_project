import 'package:flutter/cupertino.dart';

import '../../../core/constants/colors.dart';
import 'home_header.dart';

class HeaderDelegate extends SliverPersistentHeaderDelegate {
  HeaderDelegate(this.title);

  final String title;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: kWhiteColor,
      child: Center(
        child: HomeHeader(title: title),
      ),
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
