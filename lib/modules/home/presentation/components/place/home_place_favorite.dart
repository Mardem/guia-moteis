import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../design_system/design_system.dart';

class HomePlaceFavoriteComponent extends StatelessWidget {
  const HomePlaceFavoriteComponent({
    super.key,
    this.rating = 0,
  });

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      padding: const EdgeInsets.only(left: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: AppColors.yellow,
        ),
      ),
      child: Row(
        children: [
          Icon(Icons.star, color: AppColors.yellow, size: 16),
          const SizedBox(width: 2),
          Text(
            rating.toString(),
            softWrap: true,
            overflow: TextOverflow.visible,
            style: GoogleFonts.openSans(
              textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color.fromRGBO(80, 80, 80, 1.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
