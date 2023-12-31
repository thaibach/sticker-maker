// ignore_for_file: prefer_const_constructors
import 'dart:ui';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sticker_maker/src/views/settings/cubit/setting_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsLoading());

  void changeLoading() {
    emit(SettingsLoading());
  }

  share() async {
    await Share.share('https://play.google.com/store/apps/details?id=com.intes.backgrounderaser');
  }
}

class LanguageCubit extends Cubit<Locale?> {
  LanguageCubit() : super(null);

  changeStartLang() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? langCode = prefs.getString('lang');
    if (langCode != null) {
      emit(Locale(langCode, ''));
    }
  }

  changeLang(context, String data) async {
    emit(Locale(data, ''));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('lang', data);
  }
}

