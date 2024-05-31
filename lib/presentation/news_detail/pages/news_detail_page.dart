import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/icons.dart';
import '../cubit/news_detail_cubit.dart';
import '../widgets/news_detail_body.dart';
import '../widgets/news_detail_placeholder.dart';

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
                    return NewsDetailBody(state: state);
                  } else {
                    return const NewsDetailPlaceholder();
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
