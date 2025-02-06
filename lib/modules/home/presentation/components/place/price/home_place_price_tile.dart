import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../core/utils/number_format.dart';
import '../home_card_container_details.dart';
import 'home_place_price_chip.dart';

class HomePlacePriceTile extends StatelessWidget {
  const HomePlacePriceTile({
    super.key,
    required this.time,
    required this.value,
    required this.totalValue,
    this.discountPrice,
  });

  final String time;

  final double value;
  final double totalValue;
  final double? discountPrice;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      child: HomeCardContainerDetailsComponent(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
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
                      discountPrice != null
                          ? HomePlacePriceChip(
                              discount: discountPrice!,
                              defaultValue: value,
                            )
                          : const SizedBox.shrink()
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      discountPrice != null
                          ? Text(
                              NumberFormatUtil.formatReal(value: value),
                              style: GoogleFonts.openSans(
                                textStyle: const TextStyle(
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontSize: 20,
                                  decoration: TextDecoration.lineThrough,
                                ),
                              ),
                            )
                          : const SizedBox.shrink(),
                      SizedBox(width: discountPrice != null ? 8 : 0),
                      Text(
                        NumberFormatUtil.formatReal(value: totalValue),
                        style: GoogleFonts.openSans(
                          textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 20,
                            color: Color.fromRGBO(80, 80, 80, 1.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Icon(
                LucideIcons.chevron_right,
                color: Color.fromRGBO(80, 80, 80, 1.0),
              )
            ],
          ),
        ),
      ),
    );
  }
}
