part of 'login_bloc.dart';

enum LoginStatus {
  initial,
  loading,
  submiting,
  successLogin,
  errorLogin,
}

class LoginState extends Equatable {
  final LoginResponse loginResponse;
  final LoginStatus status;
  final FailureModel failure;

  const LoginState({
    required this.loginResponse,
    required this.status,
    required this.failure,
  });

  factory LoginState.initial() {
    return LoginState(
        loginResponse: LoginResponse(),
        status: LoginStatus.initial,
        failure: const FailureModel());
  }

  @override
  List<Object> get props => [loginResponse, failure, status];

  LoginState copyWith({
    LoginResponse? loginResponse,
    LoginStatus? status,
    FailureModel? failure,
  }) {
    return LoginState(
      loginResponse: loginResponse ?? this.loginResponse,
      status: status ?? this.status,
      failure: failure ?? this.failure,
    );
  }
}
