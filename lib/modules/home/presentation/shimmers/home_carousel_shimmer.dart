import 'package:flutter/material.dart';
import 'package:guia_moteis/design_system/design_system.dart';
import 'package:shimmer/shimmer.dart';

class HomeCarouselShimmer extends StatelessWidget {
  const HomeCarouselShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
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
          height: 200,
        ),
      ),
    );
  }
}
