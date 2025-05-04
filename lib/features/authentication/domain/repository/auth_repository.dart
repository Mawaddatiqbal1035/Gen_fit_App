

import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../entities/auth_failure.dart';

abstract class AuthRepository{

  Future<Either<AuthFailure,UserCredential>> login(String email,String password);

  Future<Either<AuthFailure,void>> sendPasswordResetEmail(String eMail);

  Future<void> enableLocalPersistence(Persistence persistence); // New method

}