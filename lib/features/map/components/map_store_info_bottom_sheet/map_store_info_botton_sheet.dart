import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/components/primary_button.dart';
import 'package:ishibashi/features/map/components/map_store_info_bottom_sheet/conponents/map_store_info_business_days_part.dart';
import 'package:ishibashi/features/map/components/map_store_info_bottom_sheet/conponents/map_store_info_business_time_part.dart';
import 'package:ishibashi/features/map/components/map_store_info_bottom_sheet/conponents/map_store_info_photo_part.dart';
import 'package:ishibashi/features/map/components/map_store_info_bottom_sheet/conponents/map_store_info_tags_part.dart';
import 'package:ishibashi/features/map/components/map_store_info_bottom_sheet/view_model.dart';
import 'package:ishibashi/features/store_details/page/store_detail.dart';
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
        final bool isVisibleTime =
            controller.openTime != '' && controller.closeTime != '';
        final bool isVisibleTimeSecond =
            controller.openTimeSecond != '' || controller.closeTimeSecond != '';
        final bool isVisibleDay = controller.businessDays != '';
        return SizedBox(
          height: 500,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 60),
            child: Column(
              children: [
                DecoratedBox(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: ColorName.graySecondary),
                    ),
                  ),
                  child: Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                        child: const Text('お店の情報'),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Center(
                    child: Text(
                      controller.storeName ?? '',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration:
                      const BoxDecoration(color: ColorName.backGroundYellow),
                  width: double.infinity,
                  child: MapStoreInfoPhotoPart(
                    storePhotoUrl: controller.storePhotoUrl,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: MapStoreInfoTagsPart(
                    tags: controller.tags,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    MapStoreInfoBusinessDaysPart(
                      isVisibleDay: isVisibleDay,
                      businessDays: controller.businessDays,
                      remarksDay: controller.remarksDay,
                    ),
                    MapStoreInfoBussinessTimePart(
                      isVisibleTime: isVisibleTime,
                      isVisibleTimeSecond: isVisibleTimeSecond,
                      openTime: controller.openTime,
                      closeTime: controller.closeTime,
                      openTimeSecond: controller.openTimeSecond,
                      closeTimeSecond: controller.closeTimeSecond,
                      remarksTime: controller.remarksTime,
                    ),
                  ],
                ),
                Padding(
                  padding:
                     const EdgeInsets.fromLTRB(30, 9, 30, 0),
                  child: PrimaryButton(
                    backgroundColor: ColorName.orangeBase,
                    foregroundColor: Colors.white,
                    onPressed: () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => StoreDetailPage(
                              documentId: controller.documentId),
                        ),
                      );
                    },
                    text: 'く わ し く み る',
                  ),
                ),
              ],
            ),
          ),
        );
      },
      error: (error, stackTrace) => Container(),
      loading: () => const Center(child: CircularProgressIndicator()),
    );
  }
}
