import 'dart:async';
import 'package:either_dart/src/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/src/types.dart';
import 'package:gen_fit/core/error_handling/failure.dart';
import 'package:gen_fit/core/shared_services/firbase_auth_service.dart';
import 'package:gen_fit/core/utils/app_constants/texts/app_authentication_texts_expanded.dart';
import 'package:gen_fit/features/authentication/domain/entities/auth_failure.dart';

import '../domain/repository/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository{
  AuthRepositoryImpl(this.firebaseAuthService);
  final FirebaseAuthService firebaseAuthService;

  @override
  Future<Either<AuthFailure, UserCredential>> login(
      String email, String password) async {
    try {
      // Call the authentication service for login
      var userCredential = await firebaseAuthService
          .login(email: email, password: password)
          .timeout(
        Duration(seconds: 10),
        onTimeout: () =>
        throw TimeoutException(AppAuthenticationTextsExpanded.timeout),
      );
      return Right(userCredential);
    } on FirebaseAuthException catch (e) {
      // Firebase specific error handling
      switch (e.code) {
        case 'user-not-found':
          return Left(AuthFailure(
              field: 'email',
              code: e.code,
              Message: AppAuthenticationTextsExpanded.noUserFound));
        case 'wrong-password':
          return Left(AuthFailure(
              field: 'password',
              code: e.code,
              Message: AppAuthenticationTextsExpanded.incorrectPassword));
        case 'invalid-email':
          return Left(AuthFailure(
              field: 'email',
              code: e.code,
              Message: AppAuthenticationTextsExpanded.invalidEmail));
        case 'user-disabled':
          return Left(AuthFailure(
              field: 'email',
              code: e.code,
              Message: AppAuthenticationTextsExpanded.userDisabled));
        case 'too-many-requests':
          return Left(AuthFailure(
              code: e.code,
              Message: AppAuthenticationTextsExpanded.tooManyRequests));
        case 'network-request-failed':
          return Left(AuthFailure(
              code: e.code,
              Message: AppAuthenticationTextsExpanded.networkError));
        case 'invalid-credential':
          return Left(AuthFailure(
              code: e.code,
              Message: AppAuthenticationTextsExpanded.invalidCredential));
        default:
          return Left(AuthFailure(
              code: e.code,
              Message:
              "${AppAuthenticationTextsExpanded.authError} ${e.code} ${e.message}"));
      }
    }
    }



  @override
  Future<Either<AuthFailure, void>> sendPasswordResetEmail(
      String email) async {
    try {
      // Send the password reset email
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email).timeout(
        Duration(seconds: 10),
        onTimeout: () =>
        throw TimeoutException(AppAuthenticationTextsExpanded.timeout),
      );

      return const Right(null); // Success
    } on FirebaseAuthException catch (e) {
      // Handle Firebase-specific errors
      switch (e.code) {
        case 'invalid-email':
          return Left(AuthFailure(
            field: 'email',
            Message: AppAuthenticationTextsExpanded.invalidEmail,
          ));
        case 'user-not-found':
          return Left(
            AuthFailure(
              field: 'email',
              Message: AppAuthenticationTextsExpanded.noUserFound,
            ),
          );
        case 'user-disabled':
          return Left(AuthFailure(
              field: 'email',
              code: e.code,
              Message: AppAuthenticationTextsExpanded.userDisabled));
        case 'too-many-requests':
          return Left(AuthFailure(
              code: e.code,
              Message: AppAuthenticationTextsExpanded.tooManyRequests));
        case 'network-request-failed':
          return Left(AuthFailure(
              code: e.code,
              Message: AppAuthenticationTextsExpanded.networkError));
        case 'invalid-credential':
          return Left(AuthFailure(
              code: e.code,
              Message: AppAuthenticationTextsExpanded.invalidCredential));
        default:
          return Left(AuthFailure(
            Message:
            "${AppAuthenticationTextsExpanded.authError} ${e.code} ${e.message}",
          ));

      }
    }}

  @override
  Future<void> enableLocalPersistence(Persistence persistence) {
    firebaseAuthService.enableLoginPersistence(persistence: persistence);
    // TODO: implement enableLocalPersistence
    throw UnimplementedError();
  }
  }



