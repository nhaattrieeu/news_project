import 'package:flutter/cupertino.dart';

import '../../../../core/constants/colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: kWhiteColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: kBlackColor,
            ),
          ),
          CupertinoButton(
            minSize: 0,
            padding: EdgeInsets.zero,
            onPressed: () {},
            child: Text(
              "See all",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: kBodyTextColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
