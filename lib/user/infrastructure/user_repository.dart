import 'package:chat/core/infrastructure/network_exceptions.dart';
import 'package:chat/user/domain/user.dart';
import 'package:chat/user/domain/user_failure.dart';
import 'package:chat/user/infrastructure/user_remote_service.dart';
import 'package:dartz/dartz.dart';

class UserRepository {
  final UserRemoteService _userRemoteService;

  UserRepository(this._userRemoteService);

  Future<Either<UserFailure, User>> connect(
      {required String userUid, required bool isCustomer}) async {
    try {
      final user = await _userRemoteService.connect(
          userUid: userUid, isCustomer: isCustomer);
      return right(user);
    } on ApiException catch (e) {
      return left(UserFailure.connect(e.errorMessage));
    }
  }

  /*
  
  /disconnect user when the app runs in background or closes. 
  May not work if app is forcibly closed.
   */
  Future<Either<UserFailure, Unit>> disconnect(
      {required String userUid}) async {
    try {
      await _userRemoteService.disconnect(userUid: userUid);
      return right(unit);
    } on ApiException catch (e) {
      return left(UserFailure.disconnect(e.errorMessage));
    }
  }
}
