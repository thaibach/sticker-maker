abstract class PreEditState {}

class PreEditInitial extends PreEditState {}

class PreEditSuccess extends PreEditState {}

class CropEditSuccess extends PreEditState {
  final String path;
  CropEditSuccess({required this.path});
}

class PreEditError extends PreEditState {}

class RemoveBGLoading extends PreEditState {}

class RemoveBGSuccess extends PreEditState {}
