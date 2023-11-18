import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RandomStoreImagePart extends ConsumerWidget {
  const RandomStoreImagePart({
    required this.storePhotoUrl,
    super.key,
  });

  final String storePhotoUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 3, bottom: 8),
          child: ClipOval(
            child: Container(
              width: 338,
              height: 338,
              padding: const EdgeInsets.all(18),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: ClipOval(
                child: CachedNetworkImage(
                  imageUrl: storePhotoUrl.isNotEmpty
                      ? storePhotoUrl
                      : 'https://placehold.jp/150x150.png',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      );
}
