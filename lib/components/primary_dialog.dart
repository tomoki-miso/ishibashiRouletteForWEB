import 'package:flutter/material.dart';
import 'package:ishibashi/style/colors.dart';

class PrimaryDialog extends StatelessWidget {
  const PrimaryDialog({
    required this.title,
    required this.contentWidget,
    super.key,
  });

  final String title;
  final Widget contentWidget;

  @override
  Widget build(BuildContext context) => SimpleDialog(
        contentPadding: EdgeInsets.zero,
        titlePadding: EdgeInsets.zero,
        backgroundColor: ColorName.whiteBase.withOpacity(0.95),
        shadowColor: ColorName.black2,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        title: Container(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
          decoration: const BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: ColorName.greySecondary,
                width: 0.8,
              ),
            ),
          ),
          child: Text(title),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: contentWidget,
          ),
          InkWell(
            onTap: () => Navigator.pop(context),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.04,
              width: double.infinity,
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: ColorName.greyBase),
                ),
              ),
              child: Center(
                child: Text(
                  '閉じる',
                  style: TextStyle(color: Colors.blue[600]),
                ),
              ),
            ),
          ),
        ],
      );
}
