import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app.dart';

import 'data/repositories/authentication/authentication_repository.dart';
import 'firebase_options.dart';

/// -- Entry point of Flutter Application
void main() async {
  /// -- Widgets Binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

  /// -- GetX Local Storaget
  await GetStorage.init();

  // Todo: Init Payment Methods

  /// -- Await Native Splash until others items load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// -- Initialize Firebase & Authentication repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
      .then((FirebaseApp value) => Get.put(AuthenticationRepository()));

  /// -- Load all the Material Design / Themes / Bindings
  runApp(const App());
}
