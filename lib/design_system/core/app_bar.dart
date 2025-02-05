import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';

import '../design_system.dart';

class MainAppBar extends StatelessWidget {
  const MainAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 170,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.only(right: 16, left: 16, top: 20),
      decoration: BoxDecoration(color: AppColors.red),
      child: const Column(
        children: [
          SizedBox(height: 25),
          SizedBox(
            height: 80,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(LucideIcons.align_left, color: Colors.white),
                SizedBox(
                  width: 300,
                  child: AppBarButton(
                    textLeft: 'ir agora',
                    textRight: 'ir outro dia',
                    leftIcon: LucideIcons.zap,
                    rightIcon: LucideIcons.calendar_check_2,
                  ),
                ),
                Icon(LucideIcons.search, color: Colors.white),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'sudoeste e sul goiano',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Icon(LucideIcons.chevron_down, color: Colors.white),
            ],
          ),
          DottedDashedLine(
            height: 5,
            width: 160,
            axis: Axis.horizontal,
            dashColor: Color.fromRGBO(255, 255, 255, .7),
          )
        ],
      ),
    );
  }
}
