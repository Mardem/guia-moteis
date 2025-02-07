import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guia_moteis/modules/home/presentation/components/place/price/home_place_price_tile.dart';

import '../../../data/constants/category_items.dart';
import 'home_card_container_details.dart';
import 'items/home_place_items_list.dart';

class HomeRoomCard extends StatelessWidget {
  const HomeRoomCard({
    super.key,
    required this.heroImageUrl,
  });

  final String heroImageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      margin: const EdgeInsets.only(right: 16),
      child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: HomeCardContainerDetailsComponent(
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(imageUrl: heroImageUrl),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(
                      'suíte imperial',
                      style: GoogleFonts.openSans(
                        textStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color.fromRGBO(80, 80, 80, 1.0),
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const HomePlaceItemsList(
            items: HomeCategoryItems.items,
            limit: 5,
          ),
          const SizedBox(height: 4),
          const HomePlacePriceTile(
            time: '3 horas',
            value: 88,
            totalValue: 88,
          ),
          const HomePlacePriceTile(
            time: '6 horas',
            value: 101,
            totalValue: 101,
          ),
        ],
      ),
    );
  }
}
