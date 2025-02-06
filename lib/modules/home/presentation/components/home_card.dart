import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lucide/flutter_lucide.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../design_system/design_system.dart';

class HomeCard extends StatelessWidget {
  const HomeCard({
    super.key,
    required this.onPressed,
    required this.imageUrl,
  });

  final VoidCallback onPressed;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
                placeholder: (context, url) => const Center(
                  child: CircularProgressIndicator(),
                ),
                errorWidget: (context, url, error) => const Center(
                  child: Icon(Icons.error, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'volúpia motel',
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromRGBO(80, 80, 80, 1.0),
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Text(
                    'zona suburbana - mineiros',
                    softWrap: true,
                    overflow: TextOverflow.visible,
                    style: GoogleFonts.openSans(
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color.fromRGBO(80, 80, 80, 1.0),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    width: double.maxFinite,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: AppColors.grey.withOpacity(0.6),
                      borderRadius: const BorderRadius.all(Radius.circular(4)),
                    ),
                    child: Column(
                      children: [
                        Text(
                          '30% de desconto',
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromRGBO(80, 80, 80, 1.0),
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                        Container(
                          color: Colors.white,
                          margin: const EdgeInsets.only(
                            right: 16,
                            left: 16,
                          ),
                          width: MediaQuery.of(context).size.width,
                          height: 2,
                        ),
                        Text(
                          'a partir de R\$ 69,58',
                          softWrap: true,
                          overflow: TextOverflow.visible,
                          style: GoogleFonts.openSans(
                            textStyle: const TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color.fromRGBO(80, 80, 80, 1.0),
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          margin: const EdgeInsets.only(top: 4),
                          decoration: BoxDecoration(
                            color: AppColors.lightGreen,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'reservar',
                                style: GoogleFonts.openSans(
                                  textStyle: const TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                LucideIcons.chevron_right,
                                color: Colors.white,
                                size: 14,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
