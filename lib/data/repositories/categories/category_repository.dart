import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/chats/models/category_model.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import 'firebase_storage_service.dart';

class CategoryRepository extends GetxController {
  static CategoryRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all categories
  Future<List<CategoryModel>> getAllCategories() async {
    try {
      final snapshot = await _db.collection("Categories").get();
      final list = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get Sub Categories
  Future<List<CategoryModel>> getSubCategories(String categoryId) async {
    try {
      final snapshot = await _db
          .collection("Categories")
          .where('ParentId', isEqualTo: categoryId)
          .get();
      final result = snapshot.docs
          .map((document) => CategoryModel.fromSnapshot(document))
          .toList();
      return result;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Get sub categories
  /// Upload Categories to the cloud Firebase
  Future<void> uploadDummyData(List<CategoryModel> categories) async {
    try {
      AppFullScreenLoader.openLoadingDialog(
          'Data is uploading...', AppImages.cloudUploadingAnimation);
      // Upload all the Categories along with their Images
      final storage = Get.put(AppFirebaseStorageService());

      // loop though each category
      for (var category in categories) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(category.image);

        // Upload Image and Get its URL
        final url =
            await storage.uploadImageData('Categories', file, category.name);

        // Assign URL to Category.image attribute
        category.image = url;

        // Store Category in Firebase
        await _db
            .collection("Categories")
            .doc(category.id)
            .set(category.toJson());
      }
      AppFullScreenLoader.stopLoading();
      AppLoaders.successSnackBar(
        title: 'Congratulations!',
        message: 'Categories Data is Uploaded Successfully',
      );
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
