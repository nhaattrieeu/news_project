import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/presentation/onboarding/pages/onboarding_page.dart';

import 'core/constants/colors.dart';
import 'core/router/routes.dart';
import 'injection_container.dart';
import 'presentation/news/cubit/news_cubit.dart';

void main() async {
  await init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              NewsCubit(getNewsUseCase: sl(), getTrendingUseCase: sl())
                ..getTrendingData()
                ..getNewsData(),
        ),
      ],
      child: CupertinoApp(
        theme: CupertinoThemeData(
          brightness: Brightness.light,
          primaryColor: kPrimaryColor,
        ),
        routes: routes,
        home: const OnboardingPage(),
      ),
    );
  }
}
