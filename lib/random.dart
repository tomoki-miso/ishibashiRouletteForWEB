import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ishibashi/providers/storeInfo.dart';
import 'package:ishibashi/stateNotifierProvider.dart';
import 'package:ishibashi/storeClass.dart';
import 'package:ishibashi/style/styles.dart';

import 'stores.dart';

final storeProvider = StateNotifierProvider<StoreNotifier, List<StoreClass>>(
    (ref) => StoreNotifier());

class RandomPage extends ConsumerWidget {
  const RandomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var screenSize = MediaQuery.of(context).size;
    final storeProvider = ref.watch(storeInfoNotifierProvider);

    final name = storeProvider.when(
        loading: () => const Text(
              '準備中...',
              style: Styles.storeNameStyle,
            ),
        error: (e, s) => Text(
              'エラー $e',
              style: Styles.storeNameStyle,
            ),
        data: (state) => Expanded(
              child: Text(
                state.StoreName.toString(),
                style: Styles.storeNameStyle,
              ),
            )); //とりあえずExpandedにしてるけどoverFlowで管理してもいいかも。とにかくいしばしやではみ出るのを防ぎたい。

    final detail = storeProvider.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー $e'),
      data: (state) => Text(
        state.StoreDetail.toString(),
        maxLines: 3,
        overflow: TextOverflow.ellipsis,
      ), // Fix this line
    );

    final photo = storeProvider.when(
      loading: () => Image.asset('assets/images/iconKari.png'),
      error: (e, s) => Text('エラー $e'),
      data: (state) => Container(
        height: screenSize.height * 0.3,
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: state.StorePhotoUrl.isNotEmpty
            ? ClipRRect(
                borderRadius: BorderRadius.circular(5),
                child: CachedNetworkImage(
                  imageUrl: state.StorePhotoUrl.toString(),
                  width: screenSize.width * 0.8,
                  fit: BoxFit.cover,
                ))
            : Container(
                height: screenSize.height * 0.3,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Image.asset('assets/images/iconKari.png'),
              ),
      ), // Fix this line
    );

    final tags = storeProvider.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー: $e'), // エラーメッセージを表示
      data: (state) => Expanded(
        child: Row(
          children: state.Tags.isNotEmpty
              ? state.Tags.map((tag) {
                  return Container(
                    padding: EdgeInsetsDirectional.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4.0),
                      color: Colors.deepOrangeAccent,
                    ),
                    margin: const EdgeInsets.all(2.0),
                    child: Center(
                      child: Text(
                        tag,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                }).toList()
              : [],
        ),
      ),
    );

    final RandomButton = OutlinedButton(
      onPressed: () {
        final notifier = ref.read(storeInfoNotifierProvider.notifier);
        notifier.updateState();
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.lightGreenAccent,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        side: const BorderSide(color: Colors.black87),
      ),
      child: const Text(
        'お店を探す',
        style: TextStyle(
          fontSize: 22,
          color: Colors.black87,
        ),
      ),
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
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                ),
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.all(6),
                width: screenSize.width * 0.9,
                height: screenSize.height * 0.6,
                child: Column(
                  children: [
                    name,
                    Row(
                      children: [LikeButton(), tags],
                    ),
                    Container(height: screenSize.height * 0.3, child: photo),
                    Container(
                        margin: EdgeInsets.all(2),
                        height: screenSize.height * 0.09,
                        width: screenSize.width * 0.9,
                        child: detail),
                    Container(
                      child: ElevatedButton(
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.orangeAccent,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 2),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StorePage(),
                            ),
                          );
                        },
                        child: const Text("くわしくみる"),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                width: screenSize.width * 0.7,
                child: RandomButton,
              )
            ],
          ),
        ),
      ),
    );
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
