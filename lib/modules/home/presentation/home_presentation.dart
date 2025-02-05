import 'package:flutter/material.dart';
import 'package:guia_moteis/modules/home/presentation/components/home_body.dart';

import '../../../design_system/core/app_bar.dart';

class HomePresentation extends StatelessWidget {
  const HomePresentation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(top: 0, child: MainAppBar()),
          Positioned(
            top: 160,
            child: HomeBody(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(color: Colors.white),
                      height: 180,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
