import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../../personalization/models/user_model.dart';

class ChatsController extends GetxController {
  static ChatsController get isntance => Get.find();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  final RxList<UserModel> users = <UserModel>[].obs;
  final Rx<UserModel?> currentUser = Rx<UserModel?>(null);

  @override
  void onInit() {
    super.onInit();
    loadUsers();
  }

  void loadUsers() {
    final currentUserUid = _auth.currentUser?.uid;

    _firestore.collection('Users').snapshots().listen((snapshot) {
      final List<UserModel> loadedUsers = [];
      for (var doc in snapshot.docs) {
        final user = UserModel.fromSnapshot(doc);
        if (user.id == currentUserUid) {
          currentUser.value = user;
        }
        // Add the user to the list if it's not the current user
        if (user.id != currentUserUid) {
          loadedUsers.add(user);
        }
      }
      users.value = loadedUsers;
    });
  }

  String get currentUserUid => _auth.currentUser?.uid ?? '';
}
