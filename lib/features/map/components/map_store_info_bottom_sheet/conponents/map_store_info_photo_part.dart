import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ishibashi/style/colors.dart';

class MapStoreInfoPhotoPart extends StatelessWidget {
  const MapStoreInfoPhotoPart({this.storePhotoUrl, super.key});

  final String? storePhotoUrl;
  @override
  Widget build(BuildContext context) => Container(
        decoration: const BoxDecoration(color: ColorName.backGroundYellow),
        width: double.infinity,
        height: 200,
        child: storePhotoUrl != ''
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: CachedNetworkImage(
                  width: MediaQuery.of(context).size.width * 0.6,
                  imageUrl: storePhotoUrl!,
                ),
              )
            : Image.asset(
                'assets/images/icon.png',
                fit: BoxFit.cover,
              ),
      );
}
