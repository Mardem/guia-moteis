import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

import '../../../../design_system/design_system.dart';
import '../../../../main.dart';
import 'filters/home_filter_chip.dart';
import 'filters/home_filter_list.dart';

class HomeFiltersTile extends StatelessWidget {
  const HomeFiltersTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(248, 249, 251, 1),
        border: Border(
          bottom: BorderSide(
            width: 2,
            color: AppColors.darkGrey.withOpacity(0.3),
          ),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      child: Row(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(right: 8),
            child: HomeFilterChip(
              disableSelection: true,
              icon: Icon(
                LucideIcons.sliders_horizontal,
                size: 16,
                color: AppColors.black.withOpacity(.8),
              ),
              title: 'filtros',
              onPressed: () => logger.i('Filtros selecionado'),
            ),
          ),
          const Expanded(child: HomeFilterList()),
        ],
      ),
    );
  }
}
