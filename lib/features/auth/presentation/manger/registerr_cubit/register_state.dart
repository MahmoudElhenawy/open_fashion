part of 'register_cubit.dart';

@immutable
abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegistarLoading extends RegisterState {}

class RegistarSuccess extends RegisterState {}

class RegistarFailure extends RegisterState {
  final String errMessage;

  RegistarFailure(this.errMessage);
}
