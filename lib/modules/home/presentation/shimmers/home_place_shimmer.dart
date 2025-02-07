import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../design_system/design_system.dart';

class HomePlaceShimmer extends StatelessWidget {
  const HomePlaceShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 300,
          width: MediaQuery.of(context).size.width,
          child: Shimmer.fromColors(
            baseColor: AppColors.darkGrey.withOpacity(.15),
            highlightColor: Colors.white,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              width: MediaQuery.of(context).size.width,
              height: 300,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Shimmer.fromColors(
            baseColor: AppColors.darkGrey.withOpacity(.15),
            highlightColor: Colors.white,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              width: MediaQuery.of(context).size.width,
              height: 100,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Shimmer.fromColors(
            baseColor: AppColors.darkGrey.withOpacity(.15),
            highlightColor: Colors.white,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              width: MediaQuery.of(context).size.width,
              height: 100,
            ),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: Shimmer.fromColors(
            baseColor: AppColors.darkGrey.withOpacity(.15),
            highlightColor: Colors.white,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              width: MediaQuery.of(context).size.width,
              height: 100,
            ),
          ),
        ),
      ],
    );
  }
}
