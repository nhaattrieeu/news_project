import 'package:flutter/cupertino.dart';
import 'package:gap/gap.dart';

import '../../../core/constants/colors.dart';
import '../../../core/constants/images.dart';
import '../../auth/pages/login_page.dart';

class Onboarding {
  final String image;
  final String title;
  final String description;

  Onboarding({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  static String routeName = "/onboarding";

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  int pageIndex = 0;
  List<Onboarding> data = [
    Onboarding(
      image: kOnboarding1,
      title: "Lorem Ipsum is simply\ndummy",
      description:
          "Lorem Ipsum is simply dummy text of\nthe printing and typesetting industry.",
    ),
    Onboarding(
      image: kOnboarding2,
      title: "Lorem Ipsum is simply\ndummy",
      description:
          "Lorem Ipsum is simply dummy text of\nthe printing and typesetting industry.",
    ),
    Onboarding(
      image: kOnboarding3,
      title: "Lorem Ipsum is simply\ndummy",
      description:
          "Lorem Ipsum is simply dummy text of\nthe printing and typesetting industry.",
    ),
  ];
  final PageController _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (value) {
                setState(() {
                  pageIndex = value;
                });
              },
              itemCount: 3,
              itemBuilder: (context, index) {
                Onboarding onboarding = data[index];
                return Column(
                  children: [
                    Image.asset(onboarding.image),
                    Padding(
                      padding: const EdgeInsets.all(24),
                      child: SizedBox(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              onboarding.title,
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w700,
                                color: kBlackColor,
                              ),
                            ),
                            Text(
                              onboarding.description,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: kBlackColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(children: [
                  Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: pageIndex == 0 ? kPrimaryColor : kPlaceHolderColor,
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  const Gap(5),
                  Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: pageIndex == 1 ? kPrimaryColor : kPlaceHolderColor,
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                  const Gap(5),
                  Container(
                    width: 14,
                    height: 14,
                    decoration: BoxDecoration(
                      color: pageIndex == 2 ? kPrimaryColor : kPlaceHolderColor,
                      borderRadius: BorderRadius.circular(7),
                    ),
                  ),
                ]),
                Row(
                  children: [
                    Visibility(
                      visible: pageIndex != 0 ? true : false,
                      child: CupertinoButton(
                        padding: const EdgeInsets.symmetric(
                          vertical: 13,
                          horizontal: 24,
                        ),
                        borderRadius: BorderRadius.circular(6),
                        child: Text(
                          "Back",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: kBodyColor,
                          ),
                        ),
                        onPressed: () {
                          _controller.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease);
                        },
                      ),
                    ),
                    CupertinoButton.filled(
                      padding: const EdgeInsets.symmetric(
                        vertical: 13,
                        horizontal: 24,
                      ),
                      borderRadius: BorderRadius.circular(6),
                      child: Text(
                        pageIndex != 2 ? "Next" : "Get Started",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: kWhiteColor,
                        ),
                      ),
                      onPressed: () {
                        if (pageIndex == 2) {
                          Navigator.of(context)
                              .pushReplacementNamed((LoginPage.routeName));
                        } else {
                          _controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        }
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
