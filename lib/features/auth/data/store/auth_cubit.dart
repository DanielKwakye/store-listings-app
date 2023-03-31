import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paperless_listings/core/utils/enums.dart';
import 'package:paperless_listings/core/utils/injector.dart';
import 'package:paperless_listings/features/auth/data/repositories/auth_repository.dart';
import 'package:paperless_listings/features/auth/data/store/auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository = sl<AuthRepository>();

  AuthCubit() : super(const AuthState());

  void login({required String email, required String password}) async {
    try {
      emit(state.copyWith(status: BlocStatus.loginProgress));

      final either =
          await _authRepository.login(email: email, password: password);

      either.fold((l) {
        emit(state.copyWith(
            status: BlocStatus.loginFailed, message: l.errorDescription));
      }, (r) {
        emit(state.copyWith(
            status: BlocStatus.loginSuccessful, message: "Login successful."));
      });
    } catch (e) {
      emit(state.copyWith(
          status: BlocStatus.loginFailed, message: e.toString()));
    }
  }

  void logout() {
    emit(state.copyWith(status: BlocStatus.logOutInProgress));
    _authRepository.logout();
    emit(state.copyWith(status: BlocStatus.logOutSuccessful));
  }



}
