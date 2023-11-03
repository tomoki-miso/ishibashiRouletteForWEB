import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/style/colors.dart';
import 'package:ishibashi/style/styles.dart';

class StoreList extends ConsumerWidget {
  const StoreList({
    required this.onTap,
    required this.tags,
    super.key,
    required this.imageUrl,
    this.name,
    // this.detail =
    //     'こだわり抜いた魚と美味しい日本酒が楽しめます。みんなでワイワイでも、ひとりでしっぽりでも。どんなときでもくつろげる環境を提供します。',
  });
  final String? name;
  final String imageUrl;
  // final String? detail;
  final VoidCallback? onTap;
  final List<dynamic> tags;

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
                      child: imageUrl.isNotEmpty
                          ? CachedNetworkImage(
                              imageUrl: imageUrl,
                              fit: BoxFit.cover,
                            )
                          : CachedNetworkImage(
                              imageUrl:
                                  'https://placehold.jp/150x150.png', //NoTFound的な画像を足す？
                              fit: BoxFit.cover,
                            ),
                    ),
                  )),

                  //右側
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 6),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                      
                            //名前
                            Text(
                              name!,
                              style: Styles.storeNameStyle,
                            ),
                            const Padding(padding: EdgeInsets.all(12)),
                      
                            //タグ
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: tags.isNotEmpty
                                  ? tags
                                      .take(3)
                                      .map(
                                        (formattedTag) => Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 1,
                                          ),
                                          margin: const EdgeInsets.all(1),
                                          child: Center(
                                            child: Text(
                                              '#$formattedTag,',
                                              style: Styles.tagsTextStyle,
                                            ),
                                          ),
                                        ),
                                      )
                                      .toList()
                                  : [], // タグがない場合は空のリストを使用
                            ),
                            const Padding(padding: EdgeInsets.all(12)),
                      
                            //営業時間
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
                            const Text(
                              '18:00〜24:00',
                              style: Styles.businnesHours,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              )),
        ),
      );
}
