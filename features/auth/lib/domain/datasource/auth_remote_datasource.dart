import 'package:data/config/config_environtment.dart';
import 'package:data/local/shared/shared_pref.dart';
import 'package:data/models/request/auth/login_request.dart';
import 'package:data/models/response/response.dart';
import 'package:data/other/handle_failure.dart';
import 'package:data/other/response_object.dart';
import 'package:data/other/tupple.dart';
import 'package:dependencies/dio/dio.dart';
import 'package:services/internal_service/get_data_api.dart';
// ignore: depend_on_referenced_packages
import 'package:resources/constant/api_constant.dart';

class AuthRemoteDataSource extends ConfigEnvironment with GetDataApi {
  final Dio dio;
  final SharedPref sharedPref;
  AuthRemoteDataSource({required this.dio, required this.sharedPref});

  Future<LoginResponse> loginProcess(LoginRequest request) async {
    Tupple<HandleFailure, ResponseObject> data =
        await postdataAPIHeadersBodyWithFileDio(
      baseUrl: baseUrl + ApiConstant.loginUrl,
      headers: {
        "content-type": "application/json",
      },
      endPoint: "",
      nullSafety: {},
      serializer: LoginResponse.serializer,
      bodyObject: request.toMap(),
    );

    LoginResponse dataResult = data.onSuccess as LoginResponse;

    return dataResult;
  }
}
