import 'package:auth/domain/datasource/auth_remote_datasource.dart';
import 'package:auth/domain/repository/auth_repository.dart';
import 'package:data/models/request/auth/login_request.dart';
import 'package:data/models/response/auth/login_response.dart';
import 'package:data/other/failure.dart';
import 'package:data/other/service_exception.dart';
import 'package:dependencies/dartz/dartz.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepositoryImpl({
    required this.authRemoteDataSource,
  });

  @override
  Future<Either<Failure, LoginResponse>> loginProcess(
      LoginRequest request) async {
    try {
      final resultLogin = await authRemoteDataSource.loginProcess(request);
      if (resultLogin.status != null && resultLogin.status != null) {
        return Right(resultLogin);
      } else {
        return Left(ServerFailure('${resultLogin.message}'));
      }
    } on ServerException {
      return const Left(ServerFailure('Server sedang bermasalah'));
    }
  }
}
