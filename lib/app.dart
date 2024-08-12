import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bindings/general_bindings.dart';
import 'routes/app_routes.dart';
import 'utils/constants/app_colors.dart';
import 'utils/theme/app_theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      initialBinding: GeneralBindings(),
      getPages: AppRoutes.pages,
      // Show Loader or Circular Progress Indicatior meanwhile Authentication Repository is deciding to show relevent screen.
      home: const Scaffold(
          backgroundColor: AppColors.primary,
          body: Center(
            child: CircularProgressIndicator(color: Colors.white),
          )),
    );
  }
}
