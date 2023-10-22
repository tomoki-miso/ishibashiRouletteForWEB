import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ishibashi/providers/storeInfo.dart';

import 'stores.dart';

class RandomPage extends ConsumerWidget {
  const RandomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screenSize = MediaQuery.of(context).size;
    final storeInfo = ref.watch(
      storeInfoNotifierProvider,
    );

    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(screenSize.height * 0.08),
          child: AppBar(
            iconTheme: const IconThemeData(color: Colors.greenAccent),
            backgroundColor: Colors.white,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20)),
            ),
          ),
        ),
        body: Center(
            child: Container(
          width: screenSize.width,
          height: screenSize.height,
          color: Colors.greenAccent,
          child: Center(
              child: Column(children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.0),
                color: Colors.white,
              ),
              margin: const EdgeInsets.only(top: 20),
              padding: const EdgeInsets.all(6),
              width: screenSize.width * 0.9,
              height: screenSize.height * 0.6,
              child: Column(children: [
                Text(
                  storeInfo != null
                      ? storeInfo.toString()
                      : 'データなし', // null でない場合に文字列に変換
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),

                ElevatedButton(onPressed: () {}, child: Text("notifier"))
                //               Row(
                //                 children: [
                //                   LikeButton(),
                //                   Wrap(
                //                     spacing: 8,
                //                     children: formattedTags.isNotEmpty
                //                         ? formattedTags.map((formattedTag) {
                //                             return Container(
                //                               decoration: BoxDecoration(
                //                                 borderRadius:
                //                                     BorderRadius.circular(4.0),
                //                                 color: Colors.deepOrangeAccent,
                //                               ),
                //                               margin: const EdgeInsets.all(2.0),
                //                               child: Center(
                //                                 child: Text(
                //                                   formattedTag,
                //                                   style: const TextStyle(
                //                                     fontSize: 12,
                //                                     color: Colors.white,
                //                                   ),
                //                                 ),
                //                               ),
                //                             );
                //                           }).toList()
                //                         : [],
                //                   ),
                //                 ],
                //               ),
                //               Container(
                //                 height: screenSize.height * 0.3,
                //                 padding: const EdgeInsets.symmetric(vertical: 10),
                //                 child: storePhotoUrl.isNotEmpty
                //                     ? ClipRRect(
                //                         borderRadius: BorderRadius.circular(5),
                //                         child: CachedNetworkImage(
                //                           imageUrl: storePhotoUrl,
                //                           width: screenSize.width * 0.8,
                //                           fit: BoxFit.cover,
                //                         ))
                //                     : Container(),
                //               ),
                //               Container(
                //                 height: screenSize.height * 0.09,
                //                 width: screenSize.width * 0.9,
                //                 child: Text(
                //                   storeDetail,
                //                   maxLines: 3,
                //                   overflow: TextOverflow.ellipsis,
                //                 ),
                //               ),
                //               Container(
                //                 child: ElevatedButton(
                //                   style: OutlinedButton.styleFrom(
                //                     backgroundColor: Colors.orangeAccent,
                //                     padding: const EdgeInsets.symmetric(
                //                         horizontal: 20, vertical: 2),
                //                     shape: RoundedRectangleBorder(
                //                       borderRadius: BorderRadius.circular(30),
                //                     ),
                //                   ),
                //                   onPressed: () {
                //                     Navigator.push(
                //                       context,
                //                       MaterialPageRoute(
                //                         builder: (context) => StorePage(
                //                           documentId: documentId,
                //                         ),
                //                       ),
                //                     );
                //                   },
                //                   child: const Text("くわしくみる"),
                //                 ),
                //               )
                //             ],
                //           ),
                //         ),
                //         Container(
                //           padding: const EdgeInsets.only(top: 20),
                //           width: screenSize.width * 0.7,
                //           child: OutlinedButton(
                //             onPressed: _fetchData,
                //             style: OutlinedButton.styleFrom(
                //               backgroundColor: Colors.lightGreenAccent,
                //               padding: const EdgeInsets.symmetric(
                //                   horizontal: 20, vertical: 18),
                //               shape: RoundedRectangleBorder(
                //                 borderRadius: BorderRadius.circular(10),
                //               ),
                //               side: const BorderSide(color: Colors.black87),
                //             ),
                //             child: const Text(
                //               'お店を探す',
                //               style: TextStyle(
                //                 fontSize: 22,
                //                 color: Colors.black87,
                //               ),
                //             ),
                //           ),
                //         )
                //       ],
                //     ),
                //   ),
                // ),
              ]),
            ),
          ])),
        )));
  }
}

class LikeButton extends StatefulWidget {
  @override
  _LikeButtonState createState() => _LikeButtonState();
}

class _LikeButtonState extends State<LikeButton> {
  bool _isLiked = false;

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: _isLiked
          ? const Icon(Icons.favorite)
          : const Icon(Icons.favorite_border),
      onPressed: _toggleLike,
    );
  }
}

// class _RandomPageState extends State<RandomPage> {
//   String storeName = '';
//   String storeDetail = '';
//   String storeWeb = '';
//   String storeTwitter = '';
//   String storeInsta = '';
//   String storeTabelog = '';
//   String storePhotoUrl = '';
//   String documentId = '';
//   List<String> formattedTags = [];

  
// }



//   Future<void> _fetchData() async {
//     final storeSnapshot =
//         await FirebaseFirestore.instance.collection('stores').get();
//     final storeIds =
//         List.generate(storeSnapshot.docs.length, (index) => index + 1);
//     storeIds.shuffle();
//     storeIds.removeAt(0);
//     final storeId = storeIds.first;

//     final storeData = storeSnapshot.docs[storeId - 1].data();
//     final storeNameData = storeData['name'] ?? '';
//     final storeDetailData = storeData['detail'] ?? '';
//     final storeWebData = storeData['web'] ?? '';
//     final storeTwitterData = storeData['twitter'] ?? '';
//     final storeInstaData = storeData['insta'] ?? '';
//     final storeTabelogData = storeData['tabelog'] ?? '';
//     final storePhotoUrlData = storeData['photo_url'] ?? '';

//     setState(() {
//       storeName = storeNameData;
//       storeDetail = storeDetailData;
//       storeWeb = storeWebData;
//       storeTwitter = storeTwitterData;
//       storeInsta = storeInstaData;
//       storeTabelog = storeTabelogData;
//       storePhotoUrl = storePhotoUrlData;
//     });
//   }

//   Future<List<String>> _fetchTags(DocumentReference storeReference) async {
//     final storeSnapshot = await storeReference.get();
//     final storeData = storeSnapshot.data() as Map<String, dynamic>?;

//     // タグ情報を取得
//     if (storeData != null && storeData.containsKey("tags")) {
//       final tags = storeData["tags"] as List<dynamic>;
//       final formattedTags = tags.map((tag) => tag.toString()).toList();
//       return formattedTags;
//     } else {
//       return [];
//     }
//   }