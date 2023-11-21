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
        child: CircleAvatar(
          radius: MediaQuery.of(context).size.height * 0.23,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: MediaQuery.of(context).size.height * 0.23 - 18,
            backgroundImage: CachedNetworkImageProvider(
              storePhotoUrl.isNotEmpty
                  ? storePhotoUrl
                  : 'https://placehold.jp/150x150.png',

              /// TODO #18:変更
            ),
          ),
        ),
      );
}
