

import 'dart:convert';

import 'package:auth_app/core/error/failure.dart';
import 'package:auth_app/core/usecase.dart';
import 'package:auth_app/features/auth/domain/entities/sing_in.dart';
import 'package:auth_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class PostSingIn extends UseCase<SingIn,SingInParams>{
  final AuthRepository _repo;

  PostSingIn(this._repo);
  @override
  Future<Either<Failure, SingIn>> call(SingInParams params) {
     return  _repo.singIn(params);
  }

}

class SingInParams {
  final String email;
  final String password;

  SingInParams({
     this.email="",
     this.password="",
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'password': password,
    };
  
}
}
