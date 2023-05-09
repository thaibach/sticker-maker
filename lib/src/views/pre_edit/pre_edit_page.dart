import 'dart:io';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PreEditPage extends StatefulWidget {
  File? image;
  PreEditPage({Key? key, required this.image}) : super(key: key);

  @override
  State<PreEditPage> createState() => _PreEditPageState();
}

class _PreEditPageState extends State<PreEditPage> {
  final items = const [
    Icon(Icons.people, size: 30,),
    Icon(Icons.person, size: 30,),
    Icon(Icons.add, size: 30,),
    Icon(Icons.search_outlined, size: 30,)
  ];

  int index = 1;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
    backgroundColor: const Color(0xFFCECECE),
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 30,bottom: 50,right: 10,left: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.popAndPushNamed(context, '/homePage');
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 10,left: 10),
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
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                           color: Colors.white
                          ),
                          child: Center(
                            child: SvgPicture.asset('assets/icons/ic_back.svg'),
                          ),
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      margin: const EdgeInsets.only(top: 10,right: 10),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                       color: const Color(0xFF36CF00)
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white
                        ),
                        child: Center(
                          child: SvgPicture.asset('assets/icons/ic_save.svg'),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 10,right: 10,top: 10),
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
            )
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 23,left: 28,right: 28),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  gradient: const LinearGradient(
                    colors: [
                      Color(0xFFDE225B),
                      Color(0xFFE46D39),
                    ],
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                      SvgPicture.asset('assets/icons/ic_removeBgr.svg'),
                      SvgPicture.asset('assets/icons/ic_cut.svg'),
                      SvgPicture.asset('assets/icons/ic_crop.svg'),
                  ],
                ),
              ),
            ),
          )
        ],
      )
    );
  }

}
