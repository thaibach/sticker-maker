import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'app_observer.dart';
import 'package:sticker_maker/src/cubit/home_cubit/home_cubit.dart';
import 'package:sticker_maker/src/views/settings/page/settings_page.dart';

import 'src/views/views_index.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent, // transparent status bar
      statusBarIconBrightness: Brightness.dark // dark text for status bar
      ));
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.bottom]);

  runApp(MultiBlocProvider(providers: [
    // * viết các page provider vào đây
    BlocProvider<HomePageCubit>(
      create: (BuildContext context) => HomePageCubit(),
    ),
  ], child: const MyApp()));
}

//viết route cho app ở đây
final _appRouter = GoRouter(routes: [
  GoRoute(path: '/', builder: (context, state) => const SplashScreen()),
  GoRoute(path: '/homePage', builder: (context, state) => const HomePage()),
  GoRoute(
      path: '/preEditPage',
      builder: (context, state) => const PreEditPage(
            image: null,
          )),
  GoRoute(path: '/settings', builder: (context, state) => const SettingPage())
]);

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Sticker Maker',
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter,
    );
  }
}
