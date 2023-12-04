import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/style/styles.dart';

class RandomStoreDetailPart extends ConsumerWidget {
  const RandomStoreDetailPart({
    required this.storeDetail,
    super.key,
  });

  final String? storeDetail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height * 0.065;
    Widget detailTextWidget;
    if (storeDetail != null) {
      detailTextWidget = Container(
        height: height,
        padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 10),
        child: Text(
          storeDetail!,
          style: Styles.storeDetailStyle,
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
        ),
      );
    } else {
      detailTextWidget = Container(
        height: height,
      );
    }

    return detailTextWidget;
  }
}
