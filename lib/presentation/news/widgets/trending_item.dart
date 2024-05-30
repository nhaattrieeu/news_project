import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:news_project/presentation/news_detail/pages/news_detail_page.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/icons.dart';
import '../../../core/utils/time_converter.dart';
import '../../../domain/news/entities/news.dart';

class TrendingItem extends StatelessWidget {
  const TrendingItem({super.key, required this.trending});

  final News trending;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return CupertinoButton(
      onPressed: () {
        Navigator.of(context).pushNamed(NewsDetailPage.routeName);
      },
      minSize: 0,
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              imageUrl: trending.image,
              fit: BoxFit.cover,
              width: screenSize.width - 64,
              height: (screenSize.width - 64) / 2,
              placeholder: (context, url) {
                return Container(
                  width: screenSize.width - 64,
                  height: (screenSize.width - 64) / 2,
                  color: kDisableInputColor,
                );
              },
            ),
          ),
          const Gap(8),
          Text(
            trending.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w400,
              color: kBlackColor,
            ),
          ),
          const Gap(4),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: CachedNetworkImage(
                  imageUrl: trending.author.avatar,
                  width: 20,
                  height: 20,
                  placeholder: (context, url) {
                    return Container(
                      width: 20,
                      height: 20,
                      color: kDisableInputColor,
                    );
                  },
                ),
              ),
              const Gap(4),
              Text(
                trending.author.fullName,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: kBodyTextColor,
                ),
              ),
              const Gap(12),
              SvgPicture.asset(
                kIcClock,
                width: 14,
                height: 14,
              ),
              const Gap(4),
              Text(
                timeConverter(trending.createdAt),
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: kBodyTextColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
