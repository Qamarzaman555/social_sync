import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategoryModel {
  String productId;
  String categoryId;

  ProductCategoryModel({
    required this.productId,
    required this.categoryId,
  });

  /// Convert model to Json structure  so that you can store data in Firebase
  Map<String, dynamic> toJson() {
    return {
      'ProductId': productId,
      'CategoryId': categoryId,
    };
  }

  /// Map Json oriented document snapshot from firebase to UserModel
  factory ProductCategoryModel.fromSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;

    // Map JSON Record to the Model
    return ProductCategoryModel(
      productId: data['ProductId'] as String,
      categoryId: data['CategoryId'] as String,
    );
  }
}
