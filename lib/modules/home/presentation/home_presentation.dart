import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:guia_moteis/modules/home/presentation/components/home_body.dart';

import '../../../design_system/core/app_bar.dart';
import '../../../design_system/design_system.dart';
import '../../../main.dart';
import 'components/home_card.dart';

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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),
                    SizedBox(
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(4),
                        child: FlutterCarousel(
                          options: _carouselOptions(),
                          items: [1, 2, 3, 4, 5].map((i) {
                            return Builder(
                              builder: (BuildContext context) {
                                return HomeCard(
                                  imageUrl:
                                      'https://placehold.jp/3d4070/ffffff/300x300.png',
                                  onPressed: () => logger.i('Anúncio $i'),
                                );
                              },
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Container(
                      height: 60,
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      color: const Color.fromRGBO(248, 249, 251, 1),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: <Widget>[
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: AppColors.darkGrey,
                                width: 1,
                              ),
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  LucideIcons.sliders_horizontal,
                                  size: 16,
                                ),
                                Text('filtros'),
                              ],
                            ),
                          ),
                        ],
                      ),
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

  FlutterCarouselOptions _carouselOptions() => FlutterCarouselOptions(
        height: 180,
        showIndicator: true,
        viewportFraction: 1.0,
        floatingIndicator: false,
        slideIndicator: CircularSlideIndicator(
          slideIndicatorOptions: SlideIndicatorOptions(
            currentIndicatorColor: AppColors.darkGrey,
            indicatorBackgroundColor: AppColors.darkGrey.withOpacity(0.5),
          ),
        ),
      );
}
