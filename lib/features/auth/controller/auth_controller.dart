

import 'package:auth_app/features/auth/repository/auth_repositry.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final authControllerProvider =Provider((ref) {
  final authRepoProvider=ref.watch(authRespositoryProvider);
  return AuthController(authRepository:authRepoProvider);
});

class AuthController{
  AuthRepository authRepository;
  AuthController({required this.authRepository});

  /// Sing In with Firebase [Email and Password ]
  /// 
  void singInWithFirebase(String email,String password){
    authRepository.singInWithFirebase(email, password);
  }



}