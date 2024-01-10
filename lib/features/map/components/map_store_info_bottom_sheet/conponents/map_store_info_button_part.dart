import 'package:flutter/material.dart';
import 'package:ishibashi/components/primary_button.dart';
import 'package:ishibashi/features/store_details/page/store_detail.dart';
import 'package:ishibashi/style/colors.dart';

class MapStoreInfoBottonPart extends StatelessWidget {
  const MapStoreInfoBottonPart({
    required this.storeId,
    super.key,});

  final String storeId;
  @override
  Widget build(BuildContext context) => Padding(
                  padding: const EdgeInsets.fromLTRB(30, 9, 30, 0),
                  child: PrimaryButton(
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
                    text: 'く わ し く み る',
                  ),
                );
}
