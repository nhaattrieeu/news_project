import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_project/presentation/news/pages/news_page.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/icons.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static String routeName = "/home";

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        inactiveColor: kBodyTextColor,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(kIcHome),
            activeIcon: SvgPicture.asset(kIcHomeFilled),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(kIcExplore),
            activeIcon: SvgPicture.asset(kIcExploreFilled),
            label: "Explore",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(kIcBookmark),
            activeIcon: SvgPicture.asset(kIcBookmarkFilled),
            label: "Bookmark",
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(kIcProfile),
            activeIcon: SvgPicture.asset(kIcProfileFilled),
            label: "Profile",
          ),
        ],
      ),
      tabBuilder: (context, index) {
        if (index == 0) {
          return const NewsPage();
        } else {
          return const Placeholder();
        }
      },
    );
  }
}
