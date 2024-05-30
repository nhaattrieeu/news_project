import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_project/presentation/home/pages/home_page.dart';

import '../../di/di.dart';
import '../../presentation/news/cubit/news_cubit.dart';
import '../../presentation/news_detail/cubit/news_detail_cubit.dart';
import '../constants/colors.dart';
import '../router/routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NewsCubit(sl())..getNewsHomeData(),
        ),
        BlocProvider(create: (context) => NewsDetailCubit(sl())),
      ],
      child: CupertinoApp(
        theme: CupertinoThemeData(
          brightness: Brightness.light,
          primaryColor: kPrimaryColor,
        ),
        routes: routes,
        home: const HomePage(),
      ),
    );
  }
}
