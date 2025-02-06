import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../design_system/design_system.dart';

class HomeFilterCard extends StatelessWidget {
  const HomeFilterCard({
    super.key,
    required this.title,
    this.onPressed,
    this.icon,
  });

  final String title;
  final VoidCallback? onPressed;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed == null ? () {} : onPressed!(),
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: AppColors.darkGrey,
            width: 1,
          ),
        ),
        child: Row(
          children: [
            icon ?? const SizedBox.shrink(),
            const SizedBox(width: 4),
            Text(
              title,
              style: GoogleFonts.openSans(
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.black.withOpacity(.8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
