import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/chats/models/brands_model.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../categories/firebase_storage_service.dart';

class BrandRepository extends GetxController {
  static BrandRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all order related to current User
  Future<List<BrandModel>> getAllBrands() async {
    try {
      final snapshot = await _db.collection('Brands').get();
      final result =
          snapshot.docs.map((e) => BrandModel.fromSnapshot(e)).toList();
      return result;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// get Brand For category
  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      // Query to get all document where CategoryId matches the provided CategoryId
      QuerySnapshot brandCategoryQuery = await _db
          .collection('BrandCategory')
          .where('CategoryId', isEqualTo: categoryId)
          .get();

      // Extract brandIds from the document
      List<String> brandIds = brandCategoryQuery.docs
          .map((doc) => doc['BrandId'] as String)
          .toList();

      // Query to get  all documents where the brandId is in the list of brandIds, FieldPath.documentId to query documents in Collection
      final brandsQuery = await _db
          .collection('Brands')
          .where(FieldPath.documentId, whereIn: brandIds)
          .limit(2)
          .get();

      // Extract brand names or other relavent data from the documents
      List<BrandModel> brands =
          brandsQuery.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
      return brands;
    } on FirebaseException catch (e) {
      throw AppFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const AppFormatException();
    } on PlatformException catch (e) {
      throw AppPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }

  /// Upload Banners to the Cloud Firebase
  Future<void> uploadDummyData(List<BrandModel> brands) async {
    try {
      AppFullScreenLoader.openLoadingDialog(
          'Data is uploading...', AppImages.cloudUploadingAnimation);

      // Upload all the brands along with their Images
      final storage = Get.put(AppFirebaseStorageService());

      // loop though each brand
      for (var brand in brands) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(brand.image);

        // Upload Image and Get its URL
        final url = await storage.uploadImageData('Brands', file, brand.image);

        // Assign URL to Banner.image attribute
        brand.image = url;

        // Store Banner in Firebase
        await _db.collection("Brands").doc(brand.id).set(brand.toJson());
      }
      AppFullScreenLoader.stopLoading();
      AppLoaders.successSnackBar(
        title: 'Congratulations!',
        message: 'Brands Data is Uploaded Successfully',
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
