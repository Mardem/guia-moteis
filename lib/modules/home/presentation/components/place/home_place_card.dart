import 'package:flutter/material.dart';
import 'package:guia_moteis/main.dart';

import 'home_place_header.dart';
import 'home_room_card.dart';

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
            onFavoritePressed: () => logger.i('Favorito selecionado'),
            onReviewPressed: () => logger.i('Review selecionado'),
          ),
          SizedBox(
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HomeRoomCard(heroImageUrl: img),
                  HomeRoomCard(heroImageUrl: img),
                  HomeRoomCard(heroImageUrl: img),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
