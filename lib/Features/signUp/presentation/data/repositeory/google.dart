import 'package:google_sign_in/google_sign_in.dart';
import 'package:mowaterApp/core/networking/api/api_result.dart';

class GoogleSignInRepositeory {
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<ApiResult<GoogleSignInAccount>> signIn() async {
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      if (googleSignInAccount != null) {
        return ApiResult.success(googleSignInAccount);
      }

      return const ApiResult.failure('You have not selected the account');
    } catch (error) {
      print('=======================');
      print('Google Sign out error: $error');
      print('=======================');
      return ApiResult.failure(error.toString());
    }
  }

  Future<ApiResult> signOut() async {
    try {
      await _googleSignIn.signOut();
      await _googleSignIn.disconnect();
      print('=======================');
      print('User signed out from Google');
      print('=======================');
      return const ApiResult.success('success');
    } catch (error) {
      print('=======================');
      print('Google Sign out error: $error');
      print('=======================');
      return ApiResult.failure(error.toString());
    }
  }
}
