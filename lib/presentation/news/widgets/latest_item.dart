import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/icons.dart';
import '../../../../core/utils/time_converter.dart';
import '../../../domain/news/entities/news.dart';

class LatestItem extends StatelessWidget {
  const LatestItem({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        // Navigator.of(context).pushNamed(NewsDetailScreen.routeName);
      },
      minSize: 0,
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CachedNetworkImage(
              imageUrl: news.image,
              width: 96,
              height: 96,
              fit: BoxFit.cover,
            ),
          ),
          const Gap(4),
          Expanded(
            child: SizedBox(
              height: 96,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Europe",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: kBodyTextColor,
                    ),
                  ),
                  Text(
                    news.title,
                    maxLines: 2,
                    style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: kBlackColor,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                              imageUrl: news.author.avatar,
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
                            news.author.fullName,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w600,
                              color: kBodyTextColor,
                            ),
                          ),
                          const Gap(8),
                          SvgPicture.asset(
                            kIcClock,
                            width: 14,
                            height: 14,
                          ),
                          const Gap(4),
                          Text(
                            timeConverter(news.createdAt),
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: kBodyTextColor,
                            ),
                          ),
                        ],
                      ),
                      CupertinoButton(
                        onPressed: () {},
                        minSize: 0,
                        padding: EdgeInsets.zero,
                        child: SvgPicture.asset(
                          kIc3dotsHorizontal,
                          width: 14,
                          height: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
