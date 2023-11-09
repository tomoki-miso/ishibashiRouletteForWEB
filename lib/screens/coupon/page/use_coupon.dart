import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/original_app_bar.dart';

class UseCouponPage extends ConsumerWidget {
  const UseCouponPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: OriginalAppBar(),
      body: Column(
        children: [Text('a')],
      ),
    );
  }
}