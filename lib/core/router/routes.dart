import 'package:flutter/cupertino.dart';
import 'package:news_project/presentation/news_detail/pages/news_detail_page.dart';

import '../../presentation/auth/pages/login_page.dart';
import '../../presentation/auth/pages/signup_page.dart';
import '../../presentation/home/pages/home_page.dart';
import '../../presentation/onboarding/pages/onboarding_page.dart';

final Map<String, WidgetBuilder> routes = {
  OnboardingPage.routeName: (context) => const OnboardingPage(),
  LoginPage.routeName: (context) => const LoginPage(),
  SignupPage.routeName: (context) => const SignupPage(),
  HomePage.routeName: (context) => const HomePage(),
  NewsDetailPage.routeName: (context) => const NewsDetailPage(),
};
