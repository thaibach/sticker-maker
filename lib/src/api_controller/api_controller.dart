import 'dart:async';
import 'dart:developer';
import 'dart:io';
import 'package:sticker_maker/src/cubit/pre_edit_cubit/pre_edit_cubit.dart';
import 'package:dio/dio.dart';

class CallApiFeature {
  // PreEditCubit preEditCubit = PreEditCubit();
  final Dio _dio = Dio(BaseOptions(
    validateStatus: (status) => true,
  ));

  String url = "http://171.244.65.58:8000/";
  // String url = "http://103.176.148.43:8000/";
  
  Future<String?> removeBgrByAPI({required File file}) async {
    try {
      Response response = await _dio.post("${url}bgrem/",
          data: FormData.fromMap({
            "file": await MultipartFile.fromFile(file.path),
            "stype": "bgrem",
          }), onSendProgress: (int sent, int total) {
        log('Send: $sent $total');
      }, onReceiveProgress: (int sent, int total) {
        log('Receive: $sent $total');
      });
      // .timeout(const Duration(seconds: 30));
      print(response.data['status']);
      if (response.data["status"] == 200) {
        return response.data["result"];
      } else {
        return null;
      }
    } on TimeoutException catch (e) {
      print("Time out");
      return null;
    } on SocketException catch (e) {
      print('Socket Error');
      return null;
    } on Error catch (e) {
      print("Erro");
      return null;
    }
  }
}
