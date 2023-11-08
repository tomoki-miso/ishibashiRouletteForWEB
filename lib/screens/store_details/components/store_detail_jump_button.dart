import 'package:flutter/material.dart';
import 'package:ishibashi/components/primary_button.dart';
import 'package:ishibashi/style/colors.dart';

class StoreDetailsJumpButton extends StatelessWidget {
  const StoreDetailsJumpButton({
    required this.onPressed,
    required this.iconWidget,
    required this.text,
    super.key,
    this.style,
    this.circularSize,
    this.backgroundColor = ColorName.primaryBase, //デフォルトカラー
    this.foregroundColor,
    this.side = BorderSide.none,
    this.padding,
    this.elevation,
    this.shadowColor,
    this.isMini = false,
    this.isBottomNavigationBar = false,
    this.circularColor,
    this.isCircular = false,
    this.isFittedBox = false,
    this.isViewInsetsBottom = false,
  });

  final String text;
  final TextStyle? style;
  final double? circularSize;
  final double? elevation;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? shadowColor;
  final Color? circularColor;
  final BorderSide side;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final bool isMini;
  final bool isBottomNavigationBar;
  final bool isCircular;
  final bool isFittedBox;
  final bool isViewInsetsBottom;
  final Widget iconWidget;

  @override
  Widget build(BuildContext context) => Padding(
    padding: const EdgeInsets.only(bottom: 12),
    child: PrimaryButton(
          width: MediaQuery.of(context).size.width * 0.9,
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          isWithWidget: true,
          onPressed: onPressed,
          childWidget: Padding(
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 70),
            child: RichText(
              text: TextSpan(
                children: [
                  WidgetSpan(child: iconWidget),
                  TextSpan(text: text, style: const TextStyle(fontSize: 17)),
                ],
              ),
            ),
          ),
        ),
  );
}
