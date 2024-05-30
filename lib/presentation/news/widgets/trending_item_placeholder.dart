import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/colors.dart';

class TrendingItemPlaceholder extends StatelessWidget {
  const TrendingItemPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: Container(
              width: screenSize.width - 64,
              height: (screenSize.width - 64) / 2,
              color: kDisableInputColor,
            ),
          ),
          const Gap(8),
          Container(
            width: 128,
            height: 16,
            decoration: BoxDecoration(
              color: kDisableInputColor,
              borderRadius: BorderRadius.circular(6),
            ),
          ),
          const Gap(4),
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Container(
                  width: 20,
                  height: 20,
                  color: kDisableInputColor,
                ),
              ),
              const Gap(4),
              Container(
                width: 128,
                height: 13,
                decoration: BoxDecoration(
                  color: kDisableInputColor,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
              const Gap(12),
              Container(
                width: 64,
                height: 13,
                decoration: BoxDecoration(
                  color: kDisableInputColor,
                  borderRadius: BorderRadius.circular(6),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
