import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sticker_maker/src/cubit/cubit_index.dart';
import 'package:sticker_maker/src/utils/utils_index.dart';
import 'package:sticker_maker/src/views/views_index.dart';
import 'package:sticker_maker/src/widgets/custom/buttom_bar/import_buttom_bar.dart';
import 'package:sticker_maker/src/widgets/widgets_index.dart';

class PreEditPage extends StatefulWidget {
  final File? image;

  const PreEditPage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  State<PreEditPage> createState() => _PreEditPageState();
}

class _PreEditPageState extends State<PreEditPage> {
  String _functionLabel = '';
  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();
  bool unSelect = false;

  @override
  void initState() {
    super.initState();
  }

  PreEditCubit preEditCubit = PreEditCubit();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PreEditCubit, PreEditState>(
      bloc: preEditCubit,
      listener: (context, state) {
        if (state is RemoveBGLoading) {
          Loading.show(context);
        }
        if (state is RemoveBGSuccess) {
          Loading.hide(context);
          AppNavigate.navigatePage(context, EditScreen(image: preEditCubit.resultPath));
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xFFCECECE),
          body: Stack(
            children: [
              Container(
                  height: MediaQuery.of(context).size.height * 0.89,
                  margin: const EdgeInsets.only(top: 30, right: 10, left: 10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              AppNavigate.replacePage(context, const HomePage());
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 20, left: 22, bottom: 21),
                              child: SvgPicture.asset('assets/icons/ic_back_home.svg'),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            _functionLabel,
                            style: AppStyle.DEFAULT_16.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 22),
                            child: SvgPicture.asset('assets/icons/ic_save.svg'),
                          ),
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
                        padding: const EdgeInsets.all(20),
                        decoration: const BoxDecoration(
                          // color: Colors.blue,
                          image: DecorationImage(
                            image: AssetImage('assets/images/img_transparent_bgr.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        height: MediaQuery.of(context).size.height * 0.67,
                        width: double.infinity,
                        child: Center(
                          child: Image.file(File(widget.image!.path)),
                        ),
                      )
                    ],
                  )),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.only(bottom: 60 + Spacing.viewPadding.bottom),
                  child: CurvedNavigationBar(
                    click: (value) {
                      unSelect = value;
                    },
                    unSelect: unSelect,
                    key: _bottomNavigationKey,
                    index: 0,
                    height: 60.0,
                    width: AppValue.widths * 0.85,
                    items: const <String>[
                      'assets/icons/ic_removeBgr.svg',
                      'assets/icons/ic_cut.svg',
                      'assets/icons/ic_crop.svg',
                    ],
                    color: Colors.redAccent,
                    buttonBackgroundColor: Colors.yellowAccent,
                    backgroundColor: Colors.transparent,
                    animationCurve: Curves.linearToEaseOut,
                    animationDuration: Duration(milliseconds: 300),
                    onTap: (index) {
                      setState(() {
                        if (unSelect = true) {
                          if (index == 0) {
                            print('remove');
                            preEditCubit.removeImageBG(widget.image!.path);
                          } else if (index == 1) {
                            print("cut");
                          } else if (index == 2) {
                            print("crop");
                          }
                        }
                      });
                    },
                    letIndexChange: (index) => true,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
