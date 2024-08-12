import 'package:flutter/material.dart';

import '../../../../common/widgets/appbar/appbar.dart';
import '../../../../utils/constants/image_strings.dart';

class NewsFeed extends StatelessWidget {
  const NewsFeed({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        appBar: AppAppBar(
          title: Image(
            width: 140,
            fit: BoxFit.scaleDown,
            image: AssetImage(AppImages.smallAppLogo),
          ),
        ),
      ),
    );
  }
}
