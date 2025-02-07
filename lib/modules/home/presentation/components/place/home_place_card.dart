import 'package:flutter/material.dart';
import 'package:guia_moteis/main.dart';

import '../../../data/models/remote/mapper/places/home_place_motel.dart';
import '../../../data/models/remote/mapper/places/home_place_suite.dart';
import 'home_place_header.dart';
import 'home_room_card.dart';

class HomePlaceCard extends StatefulWidget {
  const HomePlaceCard({
    super.key,
    required this.place,
  });

  final HomePlaceMotel place;

  @override
  State<HomePlaceCard> createState() => _HomePlaceCardState();
}

class _HomePlaceCardState extends State<HomePlaceCard> {
  final String img =
      'https://cdn.guiademoteis.com.br/imagens/suites/big/3148_big_9827_1.jpg';

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          HomePlaceHeaderComponent(
            logoUrl: widget.place.logo,
            title: widget.place.name,
            address: widget.place.neighborhood,
            quantityReviews: widget.place.quantityFavorites,
            rating: widget.place.quantityFavorites.toDouble(),
            onFavoritePressed: () => logger.i('Favorito selecionado'),
            onReviewPressed: () => logger.i('Review selecionado'),
          ),
          SizedBox(
            child: SingleChildScrollView(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [..._renderRooms()],
              ),
            ),
          )
        ],
      ),
    );
  }

  List<Widget> _renderRooms() => widget.place.suites
      .map((HomePlaceSuite item) => HomeRoomCard(placeSuite: item))
      .toList();
}
