import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:website_absensi/data/datasource/auth_remote_datasource.dart';
import 'package:website_absensi/data/model/responses/auth_response_model.dart';

part 'login_event.dart';
part 'login_state.dart';
part 'login_bloc.freezed.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRemoteDatasource authRemoteDatasource;

  LoginBloc(this.authRemoteDatasource) : super(const LoginState.initial()) {
    on<_Login>((event, emit) async {
      emit(const LoginState.loading()); // Mengubah state ke loading

      final response = await authRemoteDatasource.login(event.email, event.password);

      if (response.isRight()) {  // Memeriksa jika response adalah Right
        emit(LoginState.success(message: 'Login berhasil!'));  // Jika login sukses
        final user = (response as Right).value;  // Mendapatkan AuthResponseModel dari Right
        emit(LoginState.loaded(user));  // Emit state loaded dengan data pengguna
      } else {
        emit(const LoginState.error('Email atau password salah'));  // Jika login gagal
      }
    });
  }
}
