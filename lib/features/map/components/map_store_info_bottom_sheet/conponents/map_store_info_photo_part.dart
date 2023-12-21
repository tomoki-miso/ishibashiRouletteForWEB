import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ishibashi/style/colors.dart';

class MapStoreInfoPhotoPart extends StatelessWidget {
  const MapStoreInfoPhotoPart({this.storePhotoUrl, super.key});

  final String? storePhotoUrl;
  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
          vertical: 20,
        ),
        decoration: const BoxDecoration(color: ColorName.backGroundYellow),
        child: SizedBox(
          
          height: 150,
          child: storePhotoUrl != ''
              ? CachedNetworkImage(
                  imageUrl: storePhotoUrl!,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  'assets/images/icon.png',
                  fit: BoxFit.cover,
                ),
        ),
      );
}
