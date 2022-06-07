import 'package:dependencies/dio/dio.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:network/network/api_helper.dart';
import 'package:network/network/api_helper_impl.dart';

class NetworkDependency {
  NetworkDependency() {
    _registerNetworkLibrary();
    _registerApiHelper();
  }
  void _registerNetworkLibrary() => locator.registerLazySingleton<Dio>(
        () => Dio(),
      );

  void _registerApiHelper() => locator.registerLazySingleton<ApiHelper>(
        () => ApiHelperImpl(
          dio: locator(),
        ),
      );
}
