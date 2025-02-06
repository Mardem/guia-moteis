import 'package:flutter/material.dart';

import '../../../../design_system/design_system.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 160,
      child: child,
    );
  }
}
