import 'package:flutter/cupertino.dart';

import '../../../core/constants/colors.dart';

class ExploreHeader extends StatelessWidget {
  const ExploreHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: kBlackColor,
      ),
    );
  }
}
