import 'package:flutter/material.dart';
import 'package:ishibashi/components/primary_button.dart';
import 'package:ishibashi/features/store_details/page/store_detail.dart';
import 'package:ishibashi/style/colors.dart';

class MapStoreInfoBottonPart extends StatelessWidget {
  const MapStoreInfoBottonPart({
    required this.storeId,
    super.key,
  });

  final String storeId;
  @override
  Widget build(BuildContext context) => PrimaryButton(
        width: MediaQuery.of(context).size.width * 0.8,
        backgroundColor: ColorName.orangeBase,
        foregroundColor: Colors.white,
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => StoreDetailPage(
                documentId: storeId,
              ),
            ),
          );
        },
        text: 'くわしくみる',
      );
}
