import 'package:data/models/request/auth/login_request.dart';
import 'package:data/models/response/response.dart';
import 'package:data/other/failure.dart';
import 'package:dependencies/dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, LoginResponse>> loginProcess(LoginRequest request);
}
