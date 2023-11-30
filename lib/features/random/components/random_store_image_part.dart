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
          radius: MediaQuery.of(context).size.height * 0.2,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: MediaQuery.of(context).size.height * 0.2 - 16,
            backgroundImage: storePhotoUrl.isNotEmpty
                ? CachedNetworkImageProvider(storePhotoUrl)
                : Image.asset('assets/images/icon.png').image
                    as ImageProvider<Object>?,
          ),
        ),
      );
}