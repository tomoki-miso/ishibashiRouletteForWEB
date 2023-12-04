import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/style/colors.dart';

class RandomStoreImagePart extends ConsumerWidget {
  const RandomStoreImagePart({
    required this.storePhotoUrl,
    super.key,
  });

  final String storePhotoUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) => PhysicalModel(
        color: ColorName.backGroundYellow,
        shadowColor: ColorName.black2,
        elevation: 20,
        shape: BoxShape.circle,
        child: CircleAvatar(
          radius: MediaQuery.of(context).size.height * 0.18,
          backgroundColor: Colors.white,
          child: CircleAvatar(
            radius: MediaQuery.of(context).size.height * 0.18 - 14,
            backgroundImage: storePhotoUrl.isNotEmpty
                ? CachedNetworkImageProvider(
                    storePhotoUrl,
                  )
                : Image.asset('assets/images/icon.png').image
                    as ImageProvider<Object>?,
          ),
        ),
      );
}
