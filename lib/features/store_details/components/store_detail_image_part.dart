import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/style/colors.dart';

class StoreDetailImagePart extends ConsumerWidget {
  const StoreDetailImagePart({
    required this.storePhotoUrl,
    super.key,
  });

  final String storePhotoUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Container(
        color: ColorName.whiteBase,
        height: MediaQuery.of(context).size.height * 0.4,
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: SizedBox(
          width: double.infinity,
          child: storePhotoUrl.isNotEmpty
              ? CachedNetworkImage(
                  imageUrl: storePhotoUrl,
                  width: MediaQuery.of(context).size.width * 0.8,
                  fit: BoxFit.cover,
                )
              : Image.asset(
                  'assets/images/icon.png',
                  width: MediaQuery.of(context).size.width * 0.8,
                  fit: BoxFit.cover,
                ),
        ),
      );
}
