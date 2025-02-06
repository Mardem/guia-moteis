import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:guia_moteis/main.dart';

import '../../../data/constants/category_items.dart';
import 'home_card_container_details.dart';
import 'home_place_header.dart';
import 'items/home_place_items_list.dart';
import 'price/home_place_price_tile.dart';

class HomePlaceCard extends StatefulWidget {
  const HomePlaceCard({super.key});

  @override
  State<HomePlaceCard> createState() => _HomePlaceCardState();
}

class _HomePlaceCardState extends State<HomePlaceCard> {
  final String logo =
      'https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif';

  final String img =
      'https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          HomePlaceHeaderComponent(
            logoUrl: logo,
            title: 'bland motel',
            address: 'zona suburbana - mineiros',
            quantityReviews: 1,
            rating: 4.8,
            onFavoritePressed: () {
              logger.i('Favorito selecionado');
            },
            onReviewPressed: () {
              logger.i('Review selecionado');
            },
          ),
          Container(
            margin: const EdgeInsets.only(top: 16),
            child: HomeCardContainerDetailsComponent(
              child: Column(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: CachedNetworkImage(imageUrl: img),
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
          const HomePlaceItemsList(items: HomeCategoryItems.items, limit: 5),
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
          const HomePlacePriceTile(
            time: '12 horas',
            value: 129.58,
            totalValue: 81.58,
            discountPrice: 48,
          )
        ],
      ),
    );
  }
}
