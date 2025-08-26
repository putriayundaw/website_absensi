import 'dart:convert'; 
import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:website_absensi/core/constans/variables.dart';
import 'package:website_absensi/data/datasource/auth_local_datasource.dart';
import 'package:website_absensi/data/model/responses/auth_response_model.dart';

class AuthRemoteDatasource {

  // Login method
  Future<Either<String, AuthResponseModel>> login(String email, String password) async {
    try {
      final response = await http.post(
        Uri.parse('${Variables.baseUrl}/login'),
        body: {'email': email, 'password': password},
      );
      
      if (response.statusCode == 200) {
        // Jika respons sukses, parse body ke AuthResponseModel
        final jsonResponse = jsonDecode(response.body);
        return Right(AuthResponseModel.fromMap(jsonResponse));  // Return Right if successful
      } else {
        // Jika gagal, kembalikan pesan error
        return Left('Login failed: ${response.body}');  // Return Left for failure
      }
    } catch (e) {
      // Jika terjadi exception, kembalikan pesan error
      return Left('Error: $e');  // Return Left for error
    }
  }


  //untuk logout
 Future<Either<String, String>> logout() async {
    try {
      final authData = await AuthLocalDatasource().getAuthData();
      if (authData == null) {
        return Left('No user is currently logged in');
      }

      final response = await http.post(
        Uri.parse('${Variables.baseUrl}/logout'),
      );

      if (response.statusCode == 200) {
        // Hapus data lokal jika logout berhasil
        await AuthLocalDatasource().removeAuthData();
        return Right('Logged out successfully');
      } else {
        return Left('Logout failed: ${response.body}');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }
}
