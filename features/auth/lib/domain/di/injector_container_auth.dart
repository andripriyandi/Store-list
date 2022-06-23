import 'package:auth/domain/datasource/auth_remote_datasource.dart';
import 'package:auth/domain/repository/auth_repository.dart';
import 'package:auth/domain/repository/auth_repository_impl.dart';
import 'package:auth/domain/usecase/auth_usecase.dart';
import 'package:auth/presentation/bloc/login_bloc.dart';
import 'package:dependencies/get_it/get_it.dart';
import 'package:dependencies/shared_preferences/shared_preferences.dart';
import 'package:data/config/dio_client.dart';
import 'package:data/local/shared/shared_pref.dart';

Future<void> init(String baseUrl) async {
  // Local
  final preferences = await SharedPreferences.getInstance();
  locator.registerLazySingleton(() => preferences);
  locator.registerLazySingleton(() => SharedPref(preferences: locator()));

  // Network
  locator.registerLazySingleton(
      () => AuthRemoteDataSource(dio: locator(), sharedPref: locator()));

  // locator.registerLazySingleton(() => locator<DioClient>().dio);
  locator.registerLazySingleton(() => DioClient(apiBaseUrl: baseUrl));

  // Use Case
  locator.registerFactory(() => AuthUseCase(authRepository: locator()));

  // API Repository
  locator.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(authRemoteDataSource: locator()));

  // inject.registerFactory(() => GetUserBankUseCase(bankRepository: inject()));

  // BLoC
  locator.registerFactory(
      () => LoginBloc(useCase: locator(), sharedPref: locator()));
}
