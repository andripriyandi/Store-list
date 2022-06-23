import 'package:auth/domain/repository/auth_repository.dart';
import 'package:data/models/request/auth/login_request.dart';
import 'package:data/models/response/response.dart';
import 'package:data/other/failure.dart';
import 'package:dependencies/dartz/dartz.dart';

class AuthUseCase {
  final AuthRepository authRepository;

  AuthUseCase({
    required this.authRepository,
  });

  Future<Either<Failure, LoginResponse>> loginProcess(LoginRequest request) {
    return authRepository.loginProcess(request);
  }
}
