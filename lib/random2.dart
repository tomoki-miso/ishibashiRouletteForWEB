import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/providers/storeInfo.dart';
import 'package:ishibashi/stateNotifierProvider.dart';
import 'package:ishibashi/storeClass.dart';

class Random2Page extends ConsumerWidget {
  const Random2Page({Key? key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final storeProvider = ref.watch(storeInfoNotifierProvider);

    final s3Text = storeProvider.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー $e'),
     data: (state) => Text(state.DocumentId),

    );

    final s2Text = storeProvider.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー $e'),
      data: (state) => Text(state.StoreName.toString()),// Fix this line
    );

    final s1Text = storeProvider.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー $e'),
      data: (state) => Text(state.StoreDetail.toString()),// Fix this line
    );

   final sText = storeProvider.when(
      loading: () => const Text('準備中...'),
      error: (e, s) => Text('エラー $e'),
      data: (state) => Text(state.Tags.toString()),// Fix this line
    );

      final s3Button = ElevatedButton(
      onPressed: () {
        final notifier = ref.read(storeInfoNotifierProvider.notifier);
        notifier.updateState();
      },
      child: const Text('変更'),
    );

    return Scaffold(
     body: Center(
       child: Column(children: [
        s3Text,
        s2Text,
        s1Text,
        sText,
        s3Button
       ],),
     )
    
    );
  }
}
