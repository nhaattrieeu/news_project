import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/icons.dart';
import '../../../core/utils/time_converter.dart';
import '../cubit/news_detail_cubit.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key});

  static String routeName = "/newsDetail";

  @override
  Widget build(BuildContext context) {
    context.read<NewsDetailCubit>().getNewsDetailData("id");

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    minSize: 0,
                    padding: EdgeInsets.zero,
                    child: SvgPicture.asset(kIcBack),
                  ),
                  Row(
                    children: [
                      CupertinoButton(
                        onPressed: () {},
                        minSize: 0,
                        padding: EdgeInsets.zero,
                        child: SvgPicture.asset(kIcShare),
                      ),
                      const Gap(8),
                      CupertinoButton(
                        onPressed: () {},
                        minSize: 0,
                        padding: EdgeInsets.zero,
                        child: SvgPicture.asset(kIc3dotsVertical),
                      )
                    ],
                  ),
                ],
              ),
              const Gap(16),
              BlocBuilder<NewsDetailCubit, NewsDetailState>(
                builder: (context, state) {
                  if (state.status == NewsDetailStatus.loaded) {
                    return Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(25),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            state.newsDetail.author.avatar,
                                        width: 50,
                                        height: 50,
                                      ),
                                    ),
                                    const Gap(4),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            state.newsDetail.author.fullName,
                                            maxLines: 1,
                                            style: TextStyle(
                                              overflow: TextOverflow.ellipsis,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w600,
                                              color: kBlackColor,
                                            ),
                                          ),
                                          Text(
                                            timeConverter(
                                                state.newsDetail.createdAt),
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: kBodyTextColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              CupertinoButton.filled(
                                onPressed: () {
                                  context
                                      .read<NewsDetailCubit>()
                                      .followButtonClick();
                                },
                                minSize: 0,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 9, horizontal: 12),
                                child: Text(
                                  state.newsDetail.author.follow
                                      ? "Following"
                                      : "Follow",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: kWhiteColor,
                                  ),
                                ),
                              )
                            ],
                          ),
                          const Gap(16),
                          Expanded(
                            child: SingleChildScrollView(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(6),
                                    child: CachedNetworkImage(
                                        imageUrl: state.newsDetail.image),
                                  ),
                                  const Gap(16),
                                  Text(
                                    state.newsDetail.title,
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w400,
                                      color: kBlackColor,
                                    ),
                                  ),
                                  const Gap(16),
                                  Text(
                                    state.newsDetail.content,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                      color: kBodyTextColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 23, top: 23, bottom: 23),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CupertinoButton(
                                      onPressed: () {
                                        context
                                            .read<NewsDetailCubit>()
                                            .loveButtonClick();
                                      },
                                      minSize: 0,
                                      padding: EdgeInsets.zero,
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(state.newsDetail.love
                                              ? kIcLoveFilled
                                              : kIcLove),
                                          const Gap(4),
                                          Text(
                                            state.newsDetail.numOfLove
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: kTitleActiveColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Gap(29),
                                    CupertinoButton(
                                      onPressed: () {
                                        showCupertinoModalPopup(
                                          context: context,
                                          builder: (context) {
                                            return CupertinoPageScaffold(
                                              child: SafeArea(
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 24,
                                                              top: 24,
                                                              right: 48),
                                                      child: Row(
                                                        children: [
                                                          CupertinoButton(
                                                            onPressed: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .pop();
                                                            },
                                                            minSize: 0,
                                                            padding:
                                                                EdgeInsets.zero,
                                                            child: SvgPicture
                                                                .asset(kIcBack),
                                                          ),
                                                          Expanded(
                                                            child: Text(
                                                              "Comments",
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                              style: TextStyle(
                                                                fontSize: 16,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400,
                                                                color:
                                                                    kBlackColor,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      minSize: 0,
                                      padding: EdgeInsets.zero,
                                      child: Row(
                                        children: [
                                          SvgPicture.asset(kIcComment),
                                          const Gap(4),
                                          Text(
                                            state.newsDetail.numOfComment
                                                .toString(),
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w400,
                                              color: kTitleActiveColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                CupertinoButton(
                                  onPressed: () {
                                    context
                                        .read<NewsDetailCubit>()
                                        .bookmarkButtonClick();
                                  },
                                  minSize: 0,
                                  padding: EdgeInsets.zero,
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(
                                        state.newsDetail.bookmark
                                            ? kIcBookmarkFilled
                                            : kIcBookmark,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  } else {
                    return const Gap(0);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
