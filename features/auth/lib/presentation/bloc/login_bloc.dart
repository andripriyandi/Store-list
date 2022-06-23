import 'package:auth/domain/usecase/auth_usecase.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:data/local/shared/shared_pref.dart';
import 'package:data/models/request/auth/login_request.dart';
import 'package:data/models/response/response.dart';
import 'package:dependencies/equatable/equatable.dart';
import 'package:data/other/failure_model.dart';
import 'package:flutter/foundation.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthUseCase useCase;
  final SharedPref sharedPref;
  LoginBloc({required this.useCase, required this.sharedPref})
      : super(LoginState.initial()) {
    on<LoginProcessEvent>(_mapPostLoginEventToState);
  }

  void _mapPostLoginEventToState(
      LoginProcessEvent event, Emitter<LoginState> emit) async {
    try {
      emit(state.copyWith(status: LoginStatus.loading));
      final resultLogin = await useCase.loginProcess(event.request);

      debugPrint("Login hit");
      resultLogin.fold(
        (failure) => emit(state.copyWith(
            status: LoginStatus.errorLogin,
            failure: FailureModel(
              message: failure.message,
            ))),
        (result) async {
          debugPrint("Login fold");
          if (result.status != null && result.status != null) {
            debugPrint("Register fold");
            emit(
              state.copyWith(
                status: LoginStatus.successLogin,
                loginResponse: result,
              ),
            );
          } else {
            emit(
              state.copyWith(
                status: LoginStatus.errorLogin,
                failure: FailureModel(
                  message: result.message!,
                ),
              ),
            );
          }
        },
      );
    } catch (error) {
      debugPrint("Kevin : $error");
      emit(state.copyWith(status: LoginStatus.errorLogin));
    }
  }
}
