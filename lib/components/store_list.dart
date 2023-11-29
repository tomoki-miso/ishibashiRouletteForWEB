import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:ishibashi/style/styles.dart';

class StoreList extends ConsumerWidget {
  const StoreList({
    required this.onTap,
    required this.tags,
    required this.imageUrl,
    required this.name,
    this.openTime,
    this.closeTime,
    super.key,
  });
  final String name;
  final String imageUrl;
  final String? openTime;
  final String? closeTime;
  final VoidCallback? onTap;
  final List<dynamic> tags;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
        child: Card(
          elevation: 8,
          color: ColorName.whiteBase,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(50)),
          ),
          child: InkWell(
            onTap: onTap,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                      child: imageUrl.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: imageUrl,
                              fit: BoxFit.cover,
                            )
                          : Image.asset('assets/images/icon.png'),
                    ),
                  ),
                ),

                /// 右側
                Expanded(
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Column(
                        children: [
                          /// 名前
                          Text(
                            name,
                            style: Styles.storeNameStyle,
                          ),
                          const Padding(padding: EdgeInsets.all(12)),

                          /// タグ
                          Wrap(
                            spacing: 1,
                            runSpacing: 1,
                            children: tags.isNotEmpty
                                ? tags.take(3).map((formattedTag) {
                                    final isLastTag = formattedTag == tags.last;
                                    return Text(
                                      '#$formattedTag${isLastTag ? '' : ','}',
                                      style: Styles.tagsTextStyle,
                                    );
                                  }).toList()
                                : [],
                          ),
                          const Padding(padding: EdgeInsets.all(12)),

                          /// 営業時間
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                '営業時間',
                                style: Styles.subTitleStyle,
                              ),
                            ),
                          ),
                          Text(
                            '$openTime〜$closeTime',
                            style: Styles.businnesHours,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
