import 'package:amimooo/core/utils/firebase_auth_service.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuthService _authService = FirebaseAuthService();

  LoginCubit() : super(LoginInitial());

  Future<void> signInWithGmail(String email, String password) async {
    emit(LoginLoading());
    try {
      bool response = await _authService.signInWithGmail(email, password);
      print(">>> Response from FirebaseAuthService: $response");
      if (response) {
        emit(LoginSuccess());
        print(">>> RegisterCubit: RegistarSuccess emitted");
      } else {
        emit(LoginFailure("خطأ في تسجيل الدخول، تحقق من البيانات."));
        print(">>> RegisterCubit: RegistarFailure false response");
      }
    } catch (e) {
      emit(LoginFailure("حدث خطأ: ${e.toString()}"));
      print(">>> RegisterCubit: Exception: $e");
    }
  }
}
