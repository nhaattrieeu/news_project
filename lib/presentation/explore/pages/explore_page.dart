import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:news_project/core/constants/colors.dart';
import 'package:news_project/domain/explore/entities/author.dart';
import 'package:news_project/presentation/explore/cubit/explore_cubit.dart';
import 'package:news_project/presentation/explore/widgets/explore_header.dart';
import 'package:news_project/presentation/explore/widgets/popular_item.dart';

import '../../../domain/news/entities/news.dart';
import '../widgets/explore_header_delegate.dart';

class ExplorePage extends StatelessWidget {
  const ExplorePage({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<ExploreCubit>().getExploreData();

    return CupertinoPageScaffold(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Explore",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w700,
                  color: kBlackColor,
                ),
              ),
              const Gap(16),
              Expanded(
                child: CustomScrollView(
                  slivers: [
                    const SliverToBoxAdapter(
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 16),
                        child: ExploreHeader(title: "Author"),
                      ),
                    ),
                    BlocBuilder<ExploreCubit, ExploreState>(
                      builder: (context, state) {
                        if (state.status == ExploreStatus.loaded) {
                          return SliverList.separated(
                            itemCount: state.explore.authors.length,
                            separatorBuilder: (context, index) {
                              return const Gap(16);
                            },
                            itemBuilder: (context, index) {
                              Author author = state.explore.authors[index];
                              return Padding(
                                padding: const EdgeInsets.all(8),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(35),
                                          child: CachedNetworkImage(
                                            imageUrl: author.avatar,
                                            width: 70,
                                            height: 70,
                                          ),
                                        ),
                                        const Gap(8),
                                        Text(
                                          author.fullName,
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                            color: kBlackColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                    CupertinoButton.filled(
                                      onPressed: () {
                                        context
                                            .read<ExploreCubit>()
                                            .followButtonClick(author.id);
                                      },
                                      minSize: 0,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 9, horizontal: 12),
                                      child: Text(
                                        author.follow ? "Following" : "Follow",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w600,
                                          color: kWhiteColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        } else {
                          return const SliverToBoxAdapter();
                        }
                      },
                    ),
                    SliverPersistentHeader(
                      floating: true,
                      pinned: true,
                      delegate: ExploreHeaderDelegate("Popular"),
                    ),
                    BlocBuilder<ExploreCubit, ExploreState>(
                      builder: (context, state) {
                        if (state.status == ExploreStatus.loaded) {
                          return SliverList.separated(
                            itemCount: state.explore.popular.length,
                            separatorBuilder: (context, index) {
                              return const Gap(16);
                            },
                            itemBuilder: (context, index) {
                              News popular = state.explore.popular[index];
                              return PopularItem(popular: popular);
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
