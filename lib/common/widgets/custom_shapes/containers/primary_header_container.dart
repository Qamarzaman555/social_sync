import 'package:flutter/material.dart';

import '../../../../utils/constants/app_colors.dart';
import '../curved_edges/curved_edges_widget.dart';
import 'circular_container.dart';

class AppPrimaryHeaderContainer extends StatelessWidget {
  const AppPrimaryHeaderContainer({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return AppCurvedEdgeWidget(
      child: Container(
        color: Colors.blue,
        padding: const EdgeInsets.all(0),

        // -- If [Size.isFinite: is not true.in Stack] error occured
        child: Stack(
          children: [
            /// -- Background Custom Shapes
            Positioned(
                top: -150,
                right: -250,
                child: AppCircularContainer(
                    backgroundColor: AppColors.textWhite.withOpacity(0.1))),
            Positioned(
                top: 100,
                right: -300,
                child: AppCircularContainer(
                    backgroundColor: AppColors.textWhite.withOpacity(0.1))),
            child,
          ],
        ),
      ),
    );
  }
}
