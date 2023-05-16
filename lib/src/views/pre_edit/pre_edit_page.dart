import 'dart:ffi';
import 'dart:io';
import 'dart:ui' as ui;

import 'package:ffi/ffi.dart';
import 'package:flutter/material.dart';

import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sticker_maker/src/utils/utils_index.dart';
import 'package:sticker_maker/src/views/views_index.dart';
import 'package:sticker_maker/src/widgets/widgets_index.dart';
import 'package:sticker_maker/src/cubit/cubit_index.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  bool removeBg = false;
  bool cut = false;
  bool crop = false;

  @override
  void initState() {
    removeBg = true;
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
                            child: Container(
                              margin: const EdgeInsets.only(top: 10, left: 10),
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                gradient: const LinearGradient(
                                  colors: [
                                    Color(0xFFDE225B),
                                    Color(0xFFE46D39),
                                  ],
                                ),
                              ),
                              child: Container(
                                margin: const EdgeInsets.all(1),
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                                child: Center(
                                  child: SvgPicture.asset('assets/icons/ic_back.svg'),
                                ),
                              ),
                            ),
                          ),
                          const Spacer(),
                          Text(
                            _functionLabel,
                            style: AppStyle.DEFAULT_16.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Container(
                            margin: const EdgeInsets.only(top: 10, right: 10),
                            height: 50,
                            width: 50,
                            decoration:
                                BoxDecoration(borderRadius: BorderRadius.circular(15), color: const Color(0xFF36CF00)),
                            child: Container(
                              margin: const EdgeInsets.all(1),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), color: Colors.white),
                              child: Center(
                                child: SvgPicture.asset('assets/icons/ic_save.svg'),
                              ),
                            ),
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
                child: Container(
                  margin: const EdgeInsets.only(left: 30, right: 30, bottom: 55),
                  width: double.infinity,
                  height: 42,
                  child: CurvedButtonBar(
                    buttonBackgroundColor: Colors.white,
                    height: 42,
                    letIndexChange: (index) => true,
                    backgroundColor: Colors.transparent,
                    color: Colors.black,
                    animationDuration: const Duration(milliseconds: 300),
                    onTap: (index) {
                      switch (index) {
                        case 0:
                          setState(() {
                            removeBg = true;
                            crop = false;
                            cut = false;
                            _functionLabel = 'Remove Background';
                          });
                          // preEditCubit.removeImageBG(widget.image!.path);
                          break;
                        case 1:
                          setState(() {
                            cut = true;
                            crop = false;
                            removeBg = false;
                            _functionLabel = 'Cut';
                          });
                          break;
                        default:
                          setState(() {
                            crop = true;
                            removeBg = false;
                            cut = false;
                            _functionLabel = 'Frame crop';
                          });
                      }
                    },
                    items: [
                      removeBg == false
                          ? Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: SvgPicture.asset('assets/icons/ic_removeBgr.svg'),
                            )
                          : SvgPicture.asset(
                              'assets/icons/ic_removeBgr.svg',
                              color: const Color(0xFFDE225B),
                              width: 12,
                              height: 12,
                            ),
                      cut == false
                          ? SvgPicture.asset('assets/icons/ic_cut.svg')
                          : SvgPicture.asset(
                              'assets/icons/ic_cut.svg',
                              color: const Color(0xFFDE225B),
                              width: 12,
                              height: 12,
                            ),
                      crop == false
                          ? Padding(
                        padding: const EdgeInsets.only(right: 20),
                              child: SvgPicture.asset('assets/icons/ic_crop.svg'),
                            )
                          : SvgPicture.asset(
                              'assets/icons/ic_crop.svg',
                              color: const Color(0xFFDE225B),
                              width: 12,
                              height: 12,
                            ),
                      //  Icon(Icons.add,color: Colors.blue,)
                    ],
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
