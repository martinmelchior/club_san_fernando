

import 'package:dio/dio.dart' as d;
import 'package:get/get.dart';
import 'package:clubsanfernando/app/data/models/login_model.dart';


class LoginProvider extends GetConnect {

  final d.Dio _dio = Get.find<d.Dio>();

  Future<LoginResponse> autenticar(LoginRequest request) async {
   
    final d.Response r = await _dio.post("/usuarios/autenticar", 
                                            data: {
                                              "username": request.email, 
                                              "password": request.password,
                                            });

    return LoginResponse.fromJson(r.data);  

  }

}