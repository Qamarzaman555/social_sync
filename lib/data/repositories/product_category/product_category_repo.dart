import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/chats/models/product_category_model.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';

class ProductCategoryRepository extends GetxController {
  static ProductCategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Upload Banners to the Cloud Firebase
  Future<void> uploadDummyData(
      List<ProductCategoryModel> productCategories) async {
    try {
      AppFullScreenLoader.openLoadingDialog(
          'Data is uploading...', AppImages.cloudUploadingAnimation);
      // loop though each productCategory
      for (var productCategory in productCategories) {
        await _db
            .collection("ProductCategory")
            .doc()
            .set(productCategory.toJson());
      }
      AppFullScreenLoader.stopLoading();

      AppLoaders.successSnackBar(
          title: 'Congratulations!',
          message: 'Product Category Relational Data is Uploaded Successfully');
    } on FirebaseException catch (e) {
      AppFullScreenLoader.stopLoading();
      AppLoaders.errorSnackBar(
          title: 'Oh Snap!', message: AppFirebaseException(e.code).message);
    } on PlatformException catch (e) {
      AppFullScreenLoader.stopLoading();
      AppLoaders.errorSnackBar(
          title: 'Oh Snap!', message: AppPlatformException(e.code).message);
    } catch (e) {
      AppFullScreenLoader.stopLoading();
      AppLoaders.errorSnackBar(title: 'Oh Snap!', message: e.toString());
      throw 'Something went wrong. Please try again';
    }
  }
}
