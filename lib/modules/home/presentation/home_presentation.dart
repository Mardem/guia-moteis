import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';
import 'package:guia_moteis/design_system/tokens/colors.dart';
import 'package:guia_moteis/modules/home/presentation/components/home_body.dart';
import 'package:guia_moteis/modules/home/presentation/components/home_map_button.dart';

import '../../../design_system/core/app_bar.dart';
import '../../../design_system/design_system.dart';
import '../../../main.dart';
import '../data/models/remote/mapper/places/home_place.dart';
import '../data/models/remote/mapper/places/home_place_motel.dart';
import '../home.dart';
import 'components/home_card.dart';
import 'components/home_filters_tile.dart';
import 'components/place/home_place_card.dart';
import 'shimmers/home_carousel_shimmer.dart';
import 'shimmers/home_filter_shimmer.dart';
import 'shimmers/home_place_shimmer.dart';
import 'utils/sliver_app_bar.dart';

class HomePresentation extends StatefulWidget {
  const HomePresentation({super.key});

  @override
  State<HomePresentation> createState() => _HomePresentationState();
}

class _HomePresentationState extends State<HomePresentation> {
  final HomeViewmodel viewmodel = inject<HomeViewmodel>();

  @override
  void initState() {
    viewmodel.loadItems();
    super.initState();
  }

  @override
  void dispose() {
    viewmodel.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Positioned(top: 0, child: MainAppBar()),
          StreamBuilder<bool>(
            stream: viewmodel.loading,
            builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
              bool isLoading = snapshot.data ?? true;
              if (isLoading) {
                return const Positioned(
                  top: 180,
                  child: Column(
                    children: [
                      HomeCarouselShimmer(),
                      SizedBox(height: 16),
                      HomeFilterShimmer(),
                      SizedBox(height: 16),
                      HomePlaceShimmer(),
                    ],
                  ),
                );
              }

              return Positioned(
                top: 160,
                child: HomeBody(
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
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
                                          onPressed: () =>
                                              logger.i('Anúncio $i'),
                                          title: 'volúpia motel',
                                          subtitle: 'zona suburbana - mineiros',
                                        );
                                      },
                                    );
                                  }).toList(),
                                ),
                              ),
                            ),
                            const SizedBox(height: 8),
                          ],
                        ),
                      ),
                      SliverPersistentHeader(
                        pinned: true,
                        floating: false,
                        delegate: SliverAppBarDelegate(
                          minHeight: 60,
                          maxHeight: 60,
                          child: const HomeFiltersTile(),
                        ),
                      ),
                      StreamBuilder<HomePlace?>(
                        stream: viewmodel.places,
                        builder: (
                          BuildContext context,
                          AsyncSnapshot<HomePlace?> snapshot,
                        ) {
                          return SliverList(
                            delegate: SliverChildListDelegate(
                              [
                                ..._renderPlaces(places: snapshot.data),
                                const SizedBox(height: 30),
                              ],
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          Positioned(
            bottom: 20,
            width: MediaQuery.of(context).size.width,
            child: HomeMapButton(
              onPressed: () => logger.i('Mapa selecionado'),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _renderPlaces({required HomePlace? places}) {
    if (places?.data == null) {
      return [];
    }

    return places!.data.moteis.map((HomePlaceMotel item) {
      return HomePlaceCard(place: item);
    }).toList();
  }

  FlutterCarouselOptions _carouselOptions() => FlutterCarouselOptions(
        height: 180,
        showIndicator: true,
        viewportFraction: 1.0,
        autoPlay: true,
        floatingIndicator: false,
        slideIndicator: CircularSlideIndicator(
          slideIndicatorOptions: SlideIndicatorOptions(
            currentIndicatorColor: AppColors.darkGrey,
            indicatorBackgroundColor: AppColors.darkGrey.withOpacity(0.5),
          ),
        ),
      );
}
