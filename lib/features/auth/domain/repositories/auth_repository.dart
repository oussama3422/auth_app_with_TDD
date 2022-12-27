import 'package:auth_app/features/auth/domain/entities/sing_up.dart';
import 'package:auth_app/features/auth/domain/usecases/post_sing_in.dart';
import 'package:auth_app/features/auth/domain/usecases/post_sing_up.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/sing_in.dart';

abstract class AuthRepository{

  Future<Either<Failure,SingUp>> singUp(SingUpParams loginParams);
  Future<Either<Failure,SingIn>> singIn(SingInParams singUpParams);
}