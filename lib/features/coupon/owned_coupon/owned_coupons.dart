import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/original_app_bar.dart';
import 'package:ishibashi/features/coupon/use_coupon/use_coupon.dart';
import 'package:ishibashi/style/colors.dart';

class OwnedCouponsPage extends ConsumerWidget {
  const OwnedCouponsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) => Scaffold(
        appBar: const OriginalAppBar(),
        body: ListView(
          children: [
            for (int i = 0; i < 10; i++)
              Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: InkWell(
                  onTap: () async {
                    await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const UseCouponPage(),
                      ),
                    );
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.3,
                    decoration: const BoxDecoration(
                      color: ColorName.orangeBase,
                    ),
                    child: Center(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.15,
                                child:
                                    Image.asset('assets/images/iconKari.png'),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.6,
                                child: Text(
                                  'いしばしや' * 8,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                  style: const TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: ColorName.orangeBase,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Text('ドリンク10%OFF!'),
                          const Text('有効期限:2023/11/30'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
}
