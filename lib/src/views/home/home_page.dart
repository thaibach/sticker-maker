import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sticker_maker/src/cubit/cubit_index.dart';
import 'package:sticker_maker/src/utils/app_navigate.dart';
import 'package:sticker_maker/src/utils/style.dart';
import 'package:sticker_maker/src/views/home/components/components.dart';
import 'package:sticker_maker/src/views/settings/page/settings_page.dart';
import 'package:sticker_maker/src/views/views_index.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomePageCubit homeCubit = HomePageCubit();

    return WillPopScope(
      child: BlocConsumer<HomePageCubit, HomePageState>(
        bloc: homeCubit,
        listener: (context, state) {
          if (state is HomePageSuccess && homeCubit.imageFile != null) {
            AppNavigate.navigatePage(context, PreEditPage(image: homeCubit.imageFile));
          }
          if (state is HomePageError) {
            Components(homeCubit).popUpAccessRights(context);
          }
        },
        builder: (context, state) {
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
                      padding: const EdgeInsets.only(top: 30, right: 16),
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
                          child: Components(homeCubit).rowSetting(context),
                        ),
                        Container(
                          clipBehavior: Clip.none,
                          margin: const EdgeInsets.only(
                            left: 16,
                            right: 16,
                          ),
                          height: MediaQuery.of(context).size.height * 0.152,
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
                                    AppLocalizations.of(context)!.packs_lib,
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
                              const SizedBox(
                                height: 12,
                              ),
                              Text(
                                AppLocalizations.of(context)!.lab_home,
                                style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w500),
                              ),
                              Expanded(
                                child: Container(
                                  width: double.infinity,
                                  margin: const EdgeInsets.only(top: 2, left: 9, right: 9, bottom: 3),
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                    image: AssetImage('assets/images/img_ds.png'),
                                  )),
                                  child: Center(
                                    child: Text(
                                      AppLocalizations.of(context)!.lab_emp_pack,
                                      style: AppStyle.DEFAULT_14.copyWith(color: Colors.white.withOpacity(0.7)),
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
                          margin: const EdgeInsets.only(bottom: 10),
                          width: double.infinity,
                          height: MediaQuery.of(context).size.height * 0.252,
                          child: Image.asset(
                            'assets/images/image_brg_1.png',
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 8),
                          height: MediaQuery.of(context).size.height * 0.249,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage('assets/images/img_bgr_2.png'),
                          )),
                        ),
                        GestureDetector(
                          onTap: () {
                            Components(homeCubit).popUpImagePicker(context, null);
                          },
                          child: Container(
                            margin: const EdgeInsets.only(top: 10, right: 71, left: 71),
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
                                  AppLocalizations.of(context)!.crt_Sti,
                                  style: AppStyle.DEFAULT_14.copyWith(fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 2),
                                  child: SvgPicture.asset(
                                    'assets/icons/ic_add.svg',
                                    height: 16,
                                    width: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.23,
                      width: double.infinity,
                      color: Colors.white.withOpacity(0.2),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 24, right: 21),
                      child: Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SettingPage(),
                                  ));
                            },
                            child: Image.asset(
                              'assets/images/settings.png',
                              width: 48,
                              height: 48,
                            ),
                          )),
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
