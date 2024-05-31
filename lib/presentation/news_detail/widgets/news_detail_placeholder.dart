import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/colors.dart';

class NewsDetailPlaceholder extends StatelessWidget {
  const NewsDetailPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: kDisableInputColor,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
            const Gap(4),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 125,
                    height: 16,
                    decoration: BoxDecoration(
                      color: kDisableInputColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  const Gap(4),
                  Container(
                    width: 75,
                    height: 14,
                    decoration: BoxDecoration(
                      color: kDisableInputColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const Gap(16),
        Container(
          width: double.infinity,
          height: 220,
          decoration: BoxDecoration(
            color: kDisableInputColor,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const Gap(16),
        Container(
          width: 150,
          height: 24,
          decoration: BoxDecoration(
            color: kDisableInputColor,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const Gap(16),
        Container(
          width: 280,
          height: 24,
          decoration: BoxDecoration(
            color: kDisableInputColor,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
        const Gap(16),
        Container(
          width: 200,
          height: 24,
          decoration: BoxDecoration(
            color: kDisableInputColor,
            borderRadius: BorderRadius.circular(6),
          ),
        ),
      ],
    );
  }
}
