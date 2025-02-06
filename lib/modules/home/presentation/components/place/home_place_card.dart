import 'package:flutter/material.dart';
import 'package:guia_moteis/main.dart';

import 'home_place_header.dart';

class HomePlaceCard extends StatefulWidget {
  const HomePlaceCard({super.key});

  @override
  State<HomePlaceCard> createState() => _HomePlaceCardState();
}

class _HomePlaceCardState extends State<HomePlaceCard> {
  final String logo =
      'https://cdn.guiademoteis.com.br/imagens/logotipos/3148-le-nid.gif';

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
            onFavoritePressed: () {
              logger.i('Favorito selecionado');
            },
            onReviewPressed: () {
              logger.i('Review selecionado');
            },
          ),
        ],
      ),
    );
  }
}
