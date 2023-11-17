import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/style/styles.dart';

class RandomStoreTextPart extends ConsumerWidget {
  const RandomStoreTextPart({
    required this.storeDetail,
    super.key,
  });

  final String? storeDetail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Widget detailTextWidget;
    if (storeDetail != null && storeDetail!.isNotEmpty) {
      detailTextWidget = Container(
        padding: const EdgeInsets.symmetric(horizontal: 33, vertical: 10),
        child: Text(
          storeDetail!,
          style: Styles.storeDetailStyle,
        ),
      );
    } else {
      detailTextWidget = Container();
    }

    return detailTextWidget;
  }
}
