import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sticker_maker/src/cubit/cubit_index.dart';
import 'package:sticker_maker/src/utils/utils_index.dart';
import 'package:sticker_maker/src/views/views_index.dart';

class SavePackPage extends StatelessWidget {
  final File? imageFile;
  SavePackPage({super.key, this.imageFile});
  final SavePackCubit _savePackCubit = SavePackCubit();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer(
        bloc: _savePackCubit,
        builder: (context, state) {
          return SafeArea(
              child: Scaffold(
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () => AppNavigate.pop(context),
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 32,
                        )),
                    IconButton(
                        onPressed: () =>
                            AppNavigate.replacePage(context, const HomePage()),
                        icon: const Icon(
                          Icons.home,
                          size: 32,
                        ))
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    margin: const EdgeInsets.only(right: 16),
                    child: GestureDetector(
                      behavior: HitTestBehavior.translucent,
                      child: SvgPicture.asset('assets/images/save_image.svg'),
                    ),
                  ),
                ),
                AspectRatio(aspectRatio: 9 / 10, child: Image.file(imageFile!)),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 24),
                    child: SvgPicture.asset('assets/images/pack_text.svg'),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextButton(
                          onPressed: null,
                          child: SvgPicture.asset('assets/images/i3.svg')),
                      TextButton(
                          onPressed: null,
                          child: Image.asset('assets/images/i1.png')),
                      TextButton(
                          onPressed: null,
                          child: Image.asset('assets/images/i2.png')),
                    ],
                  ),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: SvgPicture.asset('assets/images/add_pack.svg'))
              ],
            ),
          ));
        },
        listener: (context, state) {});
  }
}
