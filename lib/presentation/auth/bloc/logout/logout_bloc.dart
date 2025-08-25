import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:website_absensi/data/datasource/auth_local_datasource.dart';
import 'package:website_absensi/data/datasource/auth_remote_datasource.dart';

part 'logout_event.dart';
part 'logout_state.dart';
part 'logout_bloc.freezed.dart';

class LogoutBloc extends Bloc<LogoutEvent, LogoutState> {
  final AuthRemoteDatasource authRemoteDatasource;
  LogoutBloc(
    this.authRemoteDatasource,
  ) : super(_Initial()) {
    on<_Logout>((event, emit)async {
      emit(const _Loading());
      final response = await authRemoteDatasource.logout();
     
     if(response.isLeft()){
      //error
      emit(_Error(response.fold((l) =>l, (r) => '')));

     }else{
      await AuthLocalDatasource().removeAuthData();
      emit(const _Loaded());
     }
     });
  }
}
