import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:sticker_maker/src/utils/utils_index.dart';

class ComponentsDialog{
  Future<void> diaLogBackEdit(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            surfaceTintColor: Colors.white,
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  13.0,
                ),
              ),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    AppLocalizations.of(context)!.the_sticker_has_not_been_done,
                    style: AppStyle.DEFAUlT_CONTENT_TEXT_FEED_SHARE_SOCIALMEDIA.copyWith(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      margin: const EdgeInsets.only(top: 6, bottom: 20),
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.54,
                      padding: const EdgeInsets.all(1),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          gradient: const LinearGradient(colors: [
                            Color(0xFFFF28B6),
                            Color(0xFF5060F5),
                            Color(0xFF5060F5),
                          ])),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(22),
                          color: Colors.white,
                        ),
                        child: Center(
                          child: Text(
                            AppLocalizations.of(context)!.stay,
                            style:
                            AppStyle.DEFAUlT_CONTENT_TEXT_FEED_SOCIALMEDIA.copyWith(color: const Color(0xFF5060B8)),
                          ),
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 30,
                      width: 250,
                      color: Colors.transparent,
                      child: Center(
                        child: Text(
                          AppLocalizations.of(context)!.exit,
                          style: AppStyle.DEFAUlT_CONTENT_TEXT_FEED_SOCIALMEDIA.copyWith(
                            color: const Color(0xFF626262),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}