import 'dart:io';

abstract class HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageSuccess extends HomePageState {
  final bool? status;
  HomePageSuccess({this.status,});
}

class HomePageError extends HomePageState {
}

class ChoosePermissionCameraError extends HomePageState {}

class ChoosePermissionLibraryError extends HomePageState {}

class ChoosePermissionCameraSuccess extends HomePageState {}

class ChoosePermissionLibrarySuccess extends HomePageState {}