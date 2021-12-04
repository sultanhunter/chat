import 'package:chat/user/domain/user.dart';

abstract class IUserRemoteService {
  Future<User> connect({required String userUid, required bool isCustomer});
  Future<void> disconnect({required String userUid});
}
