import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../design_system/design_system.dart';

class HomePlacePriceChip extends StatelessWidget {
  const HomePlacePriceChip({
    super.key,
    required this.discount,
    required this.defaultValue,
  });

  final double discount;
  final double defaultValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: Border.all(color: AppColors.lightGreen),
      ),
      padding: const EdgeInsets.symmetric(
        vertical: 2,
        horizontal: 6,
      ),
      child: Text(
        '${_getPercentage()}% off',
        style: GoogleFonts.openSans(
          textStyle: TextStyle(
            fontWeight: FontWeight.w500,
            color: AppColors.lightGreen,
            fontSize: 10,
          ),
        ),
      ),
    );
  }

  num _getPercentage() {
    if (defaultValue == 0) return 0;
    return ((discount / defaultValue) * 100).toInt();
  }
}
