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
    this.isBusinessTime = true,
    this.openTime,
    this.closeTime,
    this.openTimeSecond,
    this.closeTimeSecond,
    this.remarksTime,
    this.remarksDay,
    this.businessDays,
    super.key,
  });
  final String name;
  final String imageUrl;
  final String? remarksTime;
  final String? remarksDay;
  final String? openTime;
  final String? closeTime;
  final String? openTimeSecond;
  final String? closeTimeSecond;
  final VoidCallback? onTap;
  final List<dynamic> tags;
  final List<dynamic>? businessDays;
  final bool isBusinessTime;
  bool get isVisibleTime => closeTime != '' && openTime != '';
  bool get isVisibleTimeSecond => closeTimeSecond != '' || openTimeSecond != '';

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
            borderRadius: const BorderRadius.all(Radius.circular(50)),
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
                          : Image.asset(
                              'assets/images/icon.png',
                              fit: BoxFit.cover,
                            ),
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
                          if (isBusinessTime)
                            Column(
                              children: [
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
                                if (isVisibleTime)
                                  Text(
                                    '$openTime〜$closeTime',
                                    style: Styles.businnesHours,
                                  )
                                else
                                  const Padding(
                                    padding: EdgeInsets.only(top: 8),
                                    child: Text(
                                      '営業時間の情報がありません',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 10,
                                        color: ColorName.black3,
                                      ),
                                    ),
                                  ),
                                Visibility(
                                  visible: isVisibleTimeSecond,
                                  child: Text(
                                    '$openTimeSecond〜$closeTimeSecond',
                                    style: Styles.businnesHours,
                                  ),
                                ),
                                if (remarksTime != '')
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Text(
                                      '※$remarksTime',
                                      style: const TextStyle(fontSize: 10),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                              ],
                            )

                          /// 営業日
                          else
                            Column(
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(left: 20),
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      '営業日',
                                      style: Styles.subTitleStyle,
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Wrap(
                                  spacing: 1,
                                  runSpacing: 1,
                                  children: businessDays!.isNotEmpty
                                      ? businessDays!
                                          .map((formattedBusinessDays) {
                                          final isLastDay =
                                              formattedBusinessDays ==
                                                  businessDays!.last;
                                          return Text(
                                            '$formattedBusinessDays${isLastDay ? '' : ','}',
                                            style: Styles.tagsTextStyle,
                                          );
                                        }).toList()
                                      : [],
                                ),
                                if (remarksDay != '')
                                  Padding(
                                    padding: const EdgeInsets.only(top: 4),
                                    child: Text(
                                      '※$remarksDay',
                                      style: const TextStyle(fontSize: 10),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                              ],
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
