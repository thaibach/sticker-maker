import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sticker_maker/src/cubit/home_cubit/home_cubit.dart';
import 'package:sticker_maker/src/cubit/home_cubit/home_state.dart';
import 'package:sticker_maker/src/utils/style.dart';
import 'package:sticker_maker/src/views/home/components/components.dart';
import 'package:sticker_maker/src/views/pre_edit/pre_edit_page.dart';

import '../../utils/utils_index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomePageCubit(),
      child: const HomeView(),
    );
  }
}

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late HomePageCubit _homeCubit;
  int inputWidth = 320;
  int inputHeight = 320;
  int numMNNThreads = 4;
  @override
  void initState() {
    _homeCubit = HomePageCubit();
    prepareModel();
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
    return WillPopScope(
      child: BlocConsumer<HomePageCubit, HomePageState>(
        bloc: _homeCubit,
        listener: (context, state) {
          if (state is HomePageSuccess) {}
          if (state is HomePageError) {
            Components(_homeCubit).popUpAccessRights(context);
          }
          if (state is HomePageSuccess) {
            state.status == true
                ? Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PreEditPage(image: _homeCubit.imageFile)))
                : Navigator.popAndPushNamed(context, '/homePage');
          }
        },
        builder: (context, setState1) {
          return Scaffold(
            body: SafeArea(
              child: Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  // color: Colors.blue,
                  image: DecorationImage(
                    image: AssetImage('assets/images/img_bgr_homePage.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 30, right: 16),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          height: 50,
                          width: 100,
                          color: const Color(0xFFE46D39),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          child: Components(_homeCubit).rowSetting(context),
                        ),
                        Container(
                          clipBehavior: Clip.none,
                          margin: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                          ),
                          height: MediaQuery.of(context).size.height * 0.15,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color(0xFFDE225B),
                                Color(0xFFE46D39),
                              ],
                              stops: [
                                0.1,
                                0.8,
                              ],
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomRight: Radius.circular(10),
                              bottomLeft: Radius.circular(10),
                            ),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Text(
                                    'Packs library',
                                    style: AppStyle.DEFAULT_16.copyWith(
                                      fontWeight: FontWeight.w700,
                                      shadows: <Shadow>[
                                        Shadow(
                                          offset: const Offset(2.0, 4.0),
                                          blurRadius: 3.0,
                                          color: Colors.black.withOpacity(0.2),
                                        ),
                                        Shadow(
                                          offset: const Offset(1.0, 1.0),
                                          blurRadius: 8.0,
                                          color: Colors.black.withOpacity(0.2),
                                        ),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 8,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 5),
                                    child: Image.asset(
                                      'assets/images/img_packs_library.png',
                                      width: 20,
                                      height: 20,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                'No pack created',
                                style: AppStyle.DEFAULT_14
                                    .copyWith(fontWeight: FontWeight.w500),
                              ),
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(
                                      left: 13, right: 13),
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                    image:
                                        AssetImage('assets/images/img_ds.png'),
                                  )),
                                  child: Center(
                                    child: Text(
                                      'Empty pack',
                                      style: AppStyle.DEFAULT_14.copyWith(
                                          color: Colors.white.withOpacity(0.7)),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                        Image.asset(
                          'assets/images/imga_isticker.png',
                        ),
                        Container(
                          margin: const EdgeInsets.only(bottom: 12),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.257,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/images/image_brg_1.png'),
                          )),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.252,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/images/img_bgr_2.png'),
                          )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Components(_homeCubit)
                                .PopUpImagePicker(context, null);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(
                                top: 10, right: 71, left: 71),
                            height: 45,
                            width: double.infinity,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                gradient: const LinearGradient(colors: [
                                  Color(0xFFDE225B),
                                  Color(0xFFE46D39),
                                ])),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Start making sticker',
                                  style: AppStyle.DEFAULT_14
                                      .copyWith(fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                SvgPicture.asset('assets/icons/ic_add.svg')
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
      onWillPop: () => Future.value(false),
    );
  }
}
