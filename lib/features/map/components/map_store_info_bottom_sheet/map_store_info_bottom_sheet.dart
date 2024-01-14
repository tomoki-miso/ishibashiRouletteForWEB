import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/features/map/components/map_store_info_bottom_sheet/conponents/map_store_info_business_days_part.dart';
import 'package:ishibashi/features/map/components/map_store_info_bottom_sheet/conponents/map_store_info_business_time_part.dart';
import 'package:ishibashi/features/map/components/map_store_info_bottom_sheet/conponents/map_store_info_button_part.dart';
import 'package:ishibashi/features/map/components/map_store_info_bottom_sheet/conponents/map_store_info_photo_part.dart';
import 'package:ishibashi/features/map/components/map_store_info_bottom_sheet/conponents/map_store_info_tags_part.dart';
import 'package:ishibashi/features/map/components/map_store_info_bottom_sheet/view_model.dart';
import 'package:ishibashi/style/colors.dart';

class MapStoreInfoBottomSheet extends ConsumerWidget {
  const MapStoreInfoBottomSheet({
    required this.storeId,
    super.key,
  });

  final String storeId;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(MapStoreInfoViewModelProvider(storeId));
    return state.when(
      data: (data) {
        final controller = data.storeClass;
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            children: [
              /// ヘッダー
              DecoratedBox(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: ColorName.greyBase,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 24,
                    ),
                    const Expanded(child: Text('お店の情報')),
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(Icons.clear),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),

              /// 店名
              Text(
                controller.name ?? '',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),

              /// 画像
              MapStoreInfoPhotoPart(storePhotoUrl: controller.photo_url),
              const SizedBox(height: 8),

              /// タグ
              MapStoreInfoTagsPart(
                tags: controller.tags,
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// 営業日
                  MapStoreInfoBusinessDaysPart(
                    businessDays: controller.daysOfWeek,
                    remarksDay: controller.remarksDay,
                  ),
                  const SizedBox(width: 8),

                  /// 営業時間
                  MapStoreInfoBussinessTimePart(
                    openTime: controller.formattedOpenTime,
                    closeTime: controller.formattedCloseTime,
                    openTimeSecond: controller.formattedOpenTimeSecond,
                    closeTimeSecond: controller.formattedCloseTimeSecond,
                    remarksTime: controller.remarksTime,
                  ),
                ],
              ),

              const SizedBox(height: 16),

              /// ボタン
              MapStoreInfoBottonPart(storeId: storeId),
            ],
          ),
        );
      },
      error: (error, stackTrace) => Container(),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
