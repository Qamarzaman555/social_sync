import 'package:cloud_firestore/cloud_firestore.dart';

class BrandCategoryModel {
  String brandId;
  String categoryId;

  BrandCategoryModel({
    required this.brandId,
    required this.categoryId,
  });

  /// Convert model to Json structure  so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'BrandId': brandId,
      'CategoryId': categoryId,
    };
  }

  /// Map Json oriented document snapshot from firebase to UserModel
  factory BrandCategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    // Map JSON Record to the Model
    return BrandCategoryModel(
      brandId: data['BrandId'] as String,
      categoryId: data['CategoryId'] as String,
    );
  }
}
