import 'package:chat/core/infrastructure/network_exceptions.dart';
import 'package:chat/user/domain/user.dart';
import 'package:chat/user/infrastructure/user_remote_service_interface.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserRemoteService implements IUserRemoteService {
  final FirebaseFirestore _firebaseFirestore;

  UserRemoteService(this._firebaseFirestore);

  @override
  Future<User> connect(
      {required String userUid, required bool isCustomer}) async {
    final options = {
      'isActive': true,
      'lastSeen': '',
      'isCustomer': isCustomer,
    };

    await _firebaseFirestore
        .collection('professionals')
        .doc(userUid)
        .set(options, SetOptions(merge: true))
        .onError((error, stackTrace) =>
            throw ApiException(errorMessage: error.toString()));

    final response = await _firebaseFirestore
        .collection('professionals')
        .doc(userUid)
        .get()
        .onError((error, stackTrace) =>
            throw ApiException(errorMessage: error.toString()));

    final userData = response.data();
    final user = User.fromMap({
      'uid': userUid,
      'name': userData?['fullName'],
      'avatarUrl': userData?['avatarUrl'],
      'isActive': userData?['isActive'],
      'lastSeen': userData?['lastSeen'],
      'isCustomer': userData?['isCustomer'],
    });
    return user;
  }

  @override
  Future<void> disconnect({required String userUid}) async {
    final options = {'isActive': false, 'lastSeen': DateTime.now().toString()};

    try {
      await _firebaseFirestore
          .collection('professionals')
          .doc(userUid)
          .update(options);
    } catch (e) {
      throw ApiException();
    }
  }
}
