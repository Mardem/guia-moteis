import 'package:flutter/material.dart';

import '../../../../../main.dart';
import '../../../data/constants/filters.dart';
import 'home_filter_card.dart';

class HomeFilterList extends StatelessWidget {
  const HomeFilterList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 11),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          final String title = HomeFilters.filters[index]['name'];

          return Container(
            margin: const EdgeInsets.only(right: 8),
            child: HomeFilterCard(
              title: title,
              onPressed: () => logger.i(
                'Filtro selecionado: $title',
              ),
            ),
          );
        },
        itemCount: HomeFilters.filters.length,
      ),
    );
  }
}
