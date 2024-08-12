import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/chats/models/banner_model.dart';
import '../../../utils/constants/image_strings.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../utils/popups/full_screen_loader.dart';
import '../../../utils/popups/loaders.dart';
import '../categories/firebase_storage_service.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  /// Variables
  final _db = FirebaseFirestore.instance;

  /// Get all order related to current User
  Future<List<BannerModel>> fetchBanners() async {
    try {
      final result = await _db
          .collection('Banners')
          .where('Active', isEqualTo: true)
          .get();
      return result.docs
          .map((documentSnapshot) => BannerModel.fromSnapshot(documentSnapshot))
          .toList();
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
  Future<void> uploadDummyData(List<BannerModel> banners) async {
    try {
      AppFullScreenLoader.openLoadingDialog(
          'Data is uploading...', AppImages.cloudUploadingAnimation);
      // Upload all the banners along with their Images
      final storage = Get.put(AppFirebaseStorageService());

      // loop though each banner
      for (var banner in banners) {
        // Get ImageData link from the local assets
        final file = await storage.getImageDataFromAssets(banner.imageUrl);

        // Upload Image and Get its URL
        final url =
            await storage.uploadImageData('Banners', file, banner.imageUrl);

        // Assign URL to Banner.image attribute
        banner.imageUrl = url;

        // Store Banner in Firebase
        await _db.collection("Banners").doc().set(banner.toJson());
      }
      AppFullScreenLoader.stopLoading();
      AppLoaders.successSnackBar(
        title: 'Congratulations!',
        message: 'Banners Data is Uploaded Successfully',
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
