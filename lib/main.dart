import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sticker_maker/src/utils/utils_index.dart';
import 'package:sticker_maker/src/views/settings/cubit/setting_cubit.dart';
import 'package:sticker_maker/src/views/settings/page/settings_page.dart';

import 'app_observer.dart';
import 'src/cubit/cubit_index.dart';
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
    BlocProvider<PreEditCubit>(
      create: (BuildContext context) => PreEditCubit(),
    ),
    BlocProvider<EditPageCubit>(
      create: (BuildContext context) => EditPageCubit(),
    ),
    BlocProvider<SettingsCubit>(
      create: (BuildContext context) => SettingsCubit(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int inputWidth = 320;
  int inputHeight = 320;
  int numMNNThreads = 4;
  @override
  void initState() {
    prepareModel();
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    super.initState();
  }

  Future<void> prepareModel() async {
    final directory = await getApplicationDocumentsDirectory();
    // prepare for detection
    String modelPath_ = '${directory.path}/rm_model.mnn';
    if (await File(modelPath_).exists()) {
      debugPrint("\n model file $modelPath_ was been loaded\n");
    } else {
      ByteData modelData = await rootBundle.load('assets/rm_model.mnn');
      final modelBuffer = modelData.buffer;
      File modelFile = File(modelPath_);
      await modelFile.writeAsBytes(modelBuffer.asUint8List(
          modelData.offsetInBytes, modelData.lengthInBytes));
    }
    InitModelArguments initArgs =
        InitModelArguments(modelPath_, inputWidth, inputHeight, numMNNThreads);
    initModel(initArgs);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit()..changeStartLang(),
      child: BlocBuilder<LanguageCubit, Locale?>(
        builder: (context, lang) {
          return MaterialApp(
            title: 'Sticker Maker',
            debugShowCheckedModeBanner: false,
            initialRoute: '/',
            routes: {
              "/": (context) => const SplashScreen(),
              "homePage": (context) => const HomePage(),
              "preEditPage": (context) => const PreEditPage(image: null),
              'settingsPage': (context) => const SettingPage(),
              "editPage": (context) => const EditScreen(image: null)
            },
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: const [
              Locale('en', ''),
              Locale('vi', ''),
              Locale('fr', ''),
            ],
            locale: lang,
          );
        },
      ),
    );
  }
}

