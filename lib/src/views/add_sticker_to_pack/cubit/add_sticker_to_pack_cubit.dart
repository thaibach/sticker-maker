import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sticker_maker/src/views/add_sticker_to_pack/cubit/add_sticker_to_pack_state.dart';

class AddStickerToPackCubit extends Cubit<AddStickerToPackState> {
  AddStickerToPackCubit() : super(AddStickerToPackLoading());
  bool selectedpack = false;
}
