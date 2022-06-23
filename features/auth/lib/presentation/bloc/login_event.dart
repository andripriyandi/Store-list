part of 'login_bloc.dart';

@immutable
abstract class LoginEvent {}

class LoginProcessEvent extends LoginEvent {
  final LoginRequest request;
  LoginProcessEvent({
    required this.request,
  });

  List<Object> get props => [request];
}
