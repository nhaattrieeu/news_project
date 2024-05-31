import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:news_project/presentation/news/widgets/trending_item_placeholder.dart';

import '../../../../core/constants/colors.dart';
import '../../../../core/constants/icons.dart';
import '../../../../core/constants/images.dart';
import '../cubit/news_cubit.dart';
import '../widgets/header_delegate.dart';
import '../widgets/home_header.dart';
import '../widgets/latest_item.dart';
import '../widgets/trending_item.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NewsCubit>().getNewsHomeData();

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 26, top: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(kAppImage),
                    CupertinoButton(
                      minSize: 0,
                      padding: const EdgeInsets.all(4),
                      borderRadius: BorderRadius.circular(6),
                      onPressed: () {},
                      child: SvgPicture.asset(kIcNotification),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    CupertinoSliverRefreshControl(onRefresh: () {
                      context.read<NewsCubit>().getNewsHomeData();
                      return Future.delayed(const Duration(seconds: 1));
                    }),
                    SliverPadding(
                      padding: const EdgeInsets.only(top: 16),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return CupertinoPageScaffold(
                                        backgroundColor: kWhiteColor,
                                        child: Container(),
                                      );
                                    },
                                  ),
                                );
                              },
                              child: Hero(
                                tag: "Search",
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: kBodyTextColor),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          SvgPicture.asset(kIcSearch),
                                          Text(
                                            "Search",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: kPlaceHolderColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const Gap(16),
                            const HomeHeader(title: "Trending"),
                            const Gap(16),
                            BlocBuilder<NewsCubit, NewsState>(
                              builder: (context, state) {
                                if (state is NewsLoaded) {
                                  return TrendingItem(
                                      trending: state.newsHome.trending);
                                } else {
                                  return const TrendingItemPlaceholder();
                                }
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                    SliverPersistentHeader(
                      floating: true,
                      pinned: true,
                      delegate: HeaderDelegate("Latest"),
                    ),
                    BlocBuilder<NewsCubit, NewsState>(
                      builder: (context, state) {
                        if (state is NewsLoaded) {
                          return SliverList.separated(
                            separatorBuilder: (context, index) {
                              return const Gap(16);
                            },
                            itemCount: state.newsHome.latest.length,
                            itemBuilder: (context, index) {
                              return LatestItem(
                                  news: state.newsHome.latest[index]);
                            },
                          );
                        } else {
                          return const SliverToBoxAdapter();
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
