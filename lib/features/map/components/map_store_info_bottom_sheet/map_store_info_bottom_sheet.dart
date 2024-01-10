import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ishibashi/features/map/components/map_store_info_bottom_sheet/conponents/map_store_info_button_part.dart';
import 'package:ishibashi/features/map/components/map_store_info_bottom_sheet/conponents/map_store_info_business_days_part.dart';
import 'package:ishibashi/features/map/components/map_store_info_bottom_sheet/conponents/map_store_info_business_time_part.dart';
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
        final bool isVisibleDay = controller.businessDays!.isNotEmpty;
        return SizedBox(
          height: MediaQuery.of(context).size.height * 0.6,
          child: Column(
            children: [
              DecoratedBox(
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: ColorName.graySecondary),
                  ),
                ),
                child: Stack(
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                          child: const Text('お店の情報'),
                        ),
                      ],
                    ),
                    Positioned(
                      top: -2,
                      right: 3,
                      child: IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: const Icon(Icons.clear),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Text(
                controller.storeName ?? '',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
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
              Align(
                child: MapStoreInfoBusinessDaysPart(
                  isVisibleDay: isVisibleDay,
                  businessDays: controller.businessDays,
                  remarksDay: controller.remarksDay,
                ),
              ),
              const SizedBox(height: 5),
              MapStoreInfoBussinessTimePart(
                openTime: controller.openTime,
                closeTime: controller.closeTime,
                openTimeSecond: controller.openTimeSecond,
                closeTimeSecond: controller.closeTimeSecond,
                remarksTime: controller.remarksTime,
              ),
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
