import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageUrl;
  final String targetScreen;
  final bool active;

  BannerModel({
    required this.active,
    required this.imageUrl,
    required this.targetScreen,
  });

  /// Convert model to Json structure  so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'Active': active,
      'ImageUrl': imageUrl,
      'TargetScreen': targetScreen,
    };
  }

  /// Map Json oriented document snapshot from firebase to UserModel
  factory BannerModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    // Map JSON Record to the Model
    return BannerModel(
      imageUrl: data['ImageUrl'] ?? '',
      targetScreen: data['TargetScreen'] ?? '',
      active: data['Active'] ?? false,
    );
  }
}
