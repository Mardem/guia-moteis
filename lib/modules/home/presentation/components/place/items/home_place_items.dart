import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../../design_system/design_system.dart';

class HomePlaceItemsComponent extends StatelessWidget {
  const HomePlaceItemsComponent({
    super.key,
    required this.iconUrl,
    this.semanticLabel,
  });

  final String iconUrl;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: semanticLabel,
      child: Container(
        margin: const EdgeInsets.only(left: 8),
        decoration: BoxDecoration(
          color: AppColors.grey.withOpacity(.5),
          borderRadius: BorderRadius.circular(8),
        ),
        child: CachedNetworkImage(
          height: 40,
          imageUrl: iconUrl,
          fit: BoxFit.cover,
          placeholder: (context, url) => const Center(
            child: CircularProgressIndicator(),
          ),
          errorWidget: (context, url, error) => const Center(
            child: Icon(Icons.error, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
