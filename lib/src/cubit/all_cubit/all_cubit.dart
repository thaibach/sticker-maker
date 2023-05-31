import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';
import 'package:sticker_maker/src/cubit/all_cubit/all_state.dart';

class AllCubit extends Cubit<AllState> {
  AllCubit() : super(AllLoading());

  share() async {
    await Share.share('https://play.google.com/store/apps/details?id=com.intes.backgrounderaser');
  }
}
