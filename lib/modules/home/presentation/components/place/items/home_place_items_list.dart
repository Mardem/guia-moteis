import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../design_system/tokens/colors.dart';
import '../home_card_container_details.dart';
import 'home_place_items.dart';

class HomePlaceItemsList extends StatelessWidget {
  const HomePlaceItemsList({
    super.key,
    required this.items,
    this.limit = 5,
  }) : assert(limit <= 6);

  final List<Map<String, dynamic>> items;
  final int limit;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      child: HomeCardContainerDetailsComponent(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ..._renderListItems(
                items: items,
                limit: limit,
              ),
              const SizedBox(width: 8),
              Row(
                children: <Widget>[
                  Text(
                    'ver \ntodos',
                    textAlign: TextAlign.end,
                    style: GoogleFonts.openSans(
                      textStyle: TextStyle(
                        height: 1,
                        fontWeight: FontWeight.w600,
                        color: AppColors.darkGrey,
                      ),
                    ),
                  ),
                  const SizedBox(width: 4),
                  Icon(
                    LucideIcons.chevron_down,
                    color: AppColors.darkGrey,
                    size: 16,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _renderListItems({
    required List<Map<String, dynamic>> items,
    int limit = 5,
  }) =>
      items
          .take(limit)
          .map(
            (Map<String, dynamic> item) => HomePlaceItemsComponent(
              iconUrl: item['icon'],
              semanticLabel: item['name'],
            ),
          )
          .toList();
}
