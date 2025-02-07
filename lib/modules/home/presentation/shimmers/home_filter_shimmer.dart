import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../design_system/tokens/colors.dart';

class HomeFilterShimmer extends StatelessWidget {
  const HomeFilterShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
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
          height: 60,
        ),
      ),
    );
  }
}
