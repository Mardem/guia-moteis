import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../home_card_container_details.dart';
import 'home_place_price_chip.dart';

class HomePlacePriceTile extends StatelessWidget {
  const HomePlacePriceTile({
    super.key,
    required this.time,
    this.hasDiscount = false,
  });

  final String time;
  final bool hasDiscount;

  @override
  Widget build(BuildContext context) {
    return HomeCardContainerDetailsComponent(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  time,
                  style: GoogleFonts.openSans(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(80, 80, 80, 1.0),
                      fontSize: 20,
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                hasDiscount
                    ? const HomePlacePriceChip(
                        discount: 48,
                        defaultValue: 129.58,
                      )
                    : const SizedBox.shrink()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
