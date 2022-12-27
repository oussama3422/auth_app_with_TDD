

import 'dart:convert';

import 'package:auth_app/core/error/failure.dart';
import 'package:auth_app/features/auth/domain/entities/sing_up.dart';
import 'package:auth_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/usecase.dart';

class PostSignUp extends UseCase<SingUp,SingUpParams>{
  
  AuthRepository repo;
  PostSignUp(this.repo);
  @override
  Future<Either<Failure, SingUp>> call(SingUpParams params) {
     return  repo.singUp(params);
  }

  
}

class SingUpParams {
  final String email;
  final String password;

  SingUpParams({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  }

}
