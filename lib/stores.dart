import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ishibashi/providers/storeInfo.dart';
import 'package:ishibashi/stateNotifierProvider.dart';
import 'package:ishibashi/storeClass.dart';
import 'package:ishibashi/style/styles.dart';
import 'package:url_launcher/url_launcher.dart';

final storeProvider = StateNotifierProvider<StoreNotifier, List<StoreClass>>(
    (ref) => StoreNotifier(),);

class StorePage extends ConsumerWidget {
  const StorePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenSize = MediaQuery.of(context).size;

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
        data: (state) => Text(
              state.StoreName,
              style: Styles.storeNameStyle,
            ),);

    final detail = storeProvider.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー $e'),
      data: (state) => Text(
        state.StoreDetail,
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
                  imageUrl: state.StorePhotoUrl,
                  width: screenSize.width * 0.8,
                  fit: BoxFit.cover,
                ),)
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
              ? state.Tags.map((tag) => Container(
                    padding: const EdgeInsetsDirectional.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: Colors.deepOrangeAccent,
                    ),
                    margin: const EdgeInsets.all(2),
                    child: Center(
                      child: Text(
                        tag,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),).toList()
              : [],
        ),
      ),
    );

    final WebButton = storeProvider.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー $e'),
      data: (state) {
        if (state.StoreWeb.isNotEmpty) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(screenSize.width * 0.8, screenSize.height * 0.01), backgroundColor: const Color.fromARGB(124, 252, 0, 0),
            ),
            onPressed: () async {
              final weburl = Uri.parse(state.StoreWeb);
              await launchUrl(weburl);
            },
            child: RichText(
              text: const TextSpan(children: [
                WidgetSpan(
                  child: Icon(
                    Icons.public,
                  ),
                ),
                TextSpan(text: '公式ウェブサイト'),
              ],),
            ),
          );
        } else {
          // StoreWeb が null または空の場合はボタンを表示しない
          return Container();
        }
      },
    );

    final TabelogButton = storeProvider.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー $e'),
      data: (state) {
        if (state.StoreTabelog.isNotEmpty) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(screenSize.width * 0.8, screenSize.height * 0.01), backgroundColor: const Color.fromARGB(255, 254, 170, 1),
            ),
            onPressed: () async {
              final tabelogurl = Uri.parse(state.StoreTabelog);
              await launchUrl(tabelogurl);
            },
            child: RichText(
              text: const TextSpan(children: [
                WidgetSpan(
                  child: Icon(
                    Icons.public,
                  ),
                ),
                TextSpan(text: '食べログ'),
              ],),
            ),
          );
        } else {
          // StoreWeb が null または空の場合はボタンを表示しない
          return Container();
        }
      },
    );

    final TwitterButton = storeProvider.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー $e'),
      data: (state) {
        if (state.StoreTwitter.isNotEmpty) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(screenSize.width * 0.8, screenSize.height * 0.01), backgroundColor: Colors.black,
            ),
            onPressed: () async {
              final Twitterurl = Uri.parse(state.StoreTwitter);
              await launchUrl(Twitterurl);
            },
            child: RichText(
              text: const TextSpan(children: [
                WidgetSpan(
                  child: FaIcon(
                    FontAwesomeIcons.twitter,
                  ),
                ),
                TextSpan(text: 'X(旧Twitter)'),
              ],),
            ),
          );
        } else {
          // StoreWeb が null または空の場合はボタンを表示しない
          return Container();
        }
      },
    );
    final InstaButton = storeProvider.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー $e'),
      data: (state) {
        if (state.StoreInsta.isNotEmpty) {
          return ElevatedButton(
            style: ElevatedButton.styleFrom(
              fixedSize: Size(screenSize.width * 0.8, screenSize.height * 0.01), backgroundColor: const Color.fromARGB(255, 99, 70, 185),
            ),
            onPressed: () async {
              final Instaurl = Uri.parse(state.StoreInsta);
              await launchUrl(Instaurl);
            },
            child: RichText(
              text: const TextSpan(children: [
                WidgetSpan(
                  child: FaIcon(
                    FontAwesomeIcons.instagram,
                  ),
                ),
                TextSpan(text: 'Instagram'),
              ],),
            ),
          );
        } else {
          // StoreWeb が null または空の場合はボタンを表示しない
          return Container();
        }
      },
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
              bottomRight: Radius.circular(20),
            ),
          ),
        ),
      ),
      body: Center(
        child: Container(
          width: screenSize.width,
          height: screenSize.height,
          color: Colors.greenAccent,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      width: screenSize.width,
                      color: Colors.greenAccent,
                      child: Center(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.white,
                          ),
                          margin: const EdgeInsets.only(top: 20),
                          padding: const EdgeInsets.all(6),
                          width: screenSize.width * 0.9,
                          child: Column(
                            children: [
                              name,
                              Row(
                                children: [const LikeButton(), tags],
                              ),
                              SizedBox(
                                  height: screenSize.height * 0.3,
                                  child: photo,),
                              Container(
                                  margin: const EdgeInsets.all(10),
                                  height: screenSize.height * 0.09,
                                  width: screenSize.width * 0.9,
                                  child: detail,),
                              WebButton,
                              TabelogButton,
                              TwitterButton,
                              InstaButton,
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class LikeButton extends StatefulWidget {
  const LikeButton({super.key});

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
  Widget build(BuildContext context) => IconButton(
      icon: _isLiked
          ? const Icon(Icons.favorite)
          : const Icon(Icons.favorite_border),
      onPressed: _toggleLike,
    );
}
