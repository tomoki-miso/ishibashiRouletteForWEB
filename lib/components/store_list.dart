import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:ishibashi/style/styles.dart';

class StoreList extends ConsumerWidget {
  const StoreList({
    required this.onTap,
    super.key,
    this.imageUrl,
    this.name = '酒と肴　よろず屋',
    this.detail =
        'こだわり抜いた魚と美味しい日本酒が楽しめます。みんなでワイワイでも、ひとりでしっぽりでも。どんなときでもくつろげる環境を提供します。',
  });
  final String? name;
  final String? imageUrl;
  final String? detail;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 18),
        child: Material(
          borderRadius: BorderRadius.circular(50.0),
          child: InkWell(
              borderRadius: BorderRadius.circular(50.0),
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: ColorName.whiteBase,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                height: MediaQuery.of(context).size.height * 0.3,
                child: Row(children: [
                  Expanded(
                      child: Container(
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: BoxDecoration(
                      color: ColorName.blackSecondary,
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(50),
                        bottomLeft: Radius.circular(50),
                      ),
                      child: CachedNetworkImage(
                        imageUrl: 'https://placehold.jp/150x150.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            name!,
                            style: Styles.storeNameStyle,
                          ),
                          // Wrap(
                          //                     direction: Axis.vertical,
                          //                     spacing: 8,
                          //                     children: tags!.isNotEmpty
                          //                         ? tags
                          //                             .take(2)
                          //                             .map((formattedTag) => Container(
                          //                               padding:
                          //                                   const EdgeInsetsDirectional
                          //                                       .symmetric(
                          //                                           horizontal:
                          //                                               6,),
                          //                               decoration:
                          //                                   BoxDecoration(
                          //                                 borderRadius:
                          //                                     BorderRadius
                          //                                         .circular(
                          //                                             4,),
                          //                                 color: Colors
                          //                                     .deepOrangeAccent,
                          //                               ),
                          //                               margin: const EdgeInsets
                          //                                   .all(1),
                          //                               child: Center(
                          //                                 child: Text(
                          //                                   formattedTag,
                          //                                   style:
                          //                                       const TextStyle(
                          //                                     fontSize: 12,
                          //                                     color:
                          //                                         Colors.white,
                          //                                   ),
                          //                                 ),
                          //                               ),
                          //                             ),).toList()
                          //                         : [],
                          //                   ),

                          Padding(padding: EdgeInsets.all(12)),
                          const Text(
                            '#海鮮,#日本酒,#居酒屋',
                            style: Styles.tagsTextStyle,
                          ),
                          Padding(padding: EdgeInsets.all(12)),
                          Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: const Text(
                                '営業時間',
                                style: Styles.subTitleStyle,
                              ),
                            ),
                          ),
                          const Text(
                            '18:00〜24:00',
                            style: Styles.businnesHours,
                          ),
                        ],
                      ),
                    ),
                  ),
                ]),
              )),
        ),
      );
}
