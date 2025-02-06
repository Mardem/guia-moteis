import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../design_system/design_system.dart';
import 'home_place_favorite.dart';

class HomePlaceHeaderComponent extends StatefulWidget {
  const HomePlaceHeaderComponent({
    super.key,
    required this.logoUrl,
    required this.title,
    required this.address,
    this.quantityReviews = 0,
    this.onFavoritePressed,
    this.onReviewPressed,
    this.rating = 0,
  });

  final String logoUrl;
  final String title;
  final String address;

  final int quantityReviews;
  final double rating;

  final VoidCallback? onFavoritePressed;
  final VoidCallback? onReviewPressed;

  @override
  State<HomePlaceHeaderComponent> createState() =>
      _HomePlaceHeaderComponentState();
}

class _HomePlaceHeaderComponentState extends State<HomePlaceHeaderComponent> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          height: 65,
          child: ClipOval(
            child: CachedNetworkImage(
              imageUrl: widget.logoUrl,
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(
                child: CircularProgressIndicator(),
              ),
              errorWidget: (context, url, error) => const Center(
                child: Icon(Icons.error, color: Colors.white),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                widget.title,
                softWrap: true,
                overflow: TextOverflow.visible,
                style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(80, 80, 80, 1.0),
                    fontSize: 24,
                  ),
                ),
              ),
              Text(
                widget.address,
                softWrap: true,
                overflow: TextOverflow.visible,
                style: GoogleFonts.openSans(
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Color.fromRGBO(80, 80, 80, 1.0),
                  ),
                ),
              ),
              Row(
                children: [
                  HomePlaceFavoriteComponent(rating: widget.rating),
                  const SizedBox(width: 8),
                  GestureDetector(
                    onTap: widget.onReviewPressed,
                    child: Row(
                      children: <Widget>[
                        Text(
                          widget.quantityReviews == 0
                              ? '0 avaliações'
                              : _getReviewsQuantity(),
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Color.fromRGBO(80, 80, 80, 1.0),
                            ),
                          ),
                        ),
                        const SizedBox(width: 4),
                        const Icon(
                          LucideIcons.chevron_down,
                          color: Color.fromRGBO(80, 80, 80, 1.0),
                          size: 16,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        IconButton(
          icon: Icon(
            Icons.favorite,
            color: isSelected ? AppColors.red : AppColors.darkGrey,
            size: 30,
          ),
          onPressed: () {
            if (widget.onFavoritePressed != null) widget.onFavoritePressed!();
            setState(() {
              isSelected = !isSelected;
            });
          },
        ),
      ],
    );
  }

  String _getReviewsQuantity() => widget.quantityReviews > 1
      ? '${widget.quantityReviews} avaliações'
      : '${widget.quantityReviews} avaliação';
}
