import 'package:flutter/material.dart';
import 'package:ishibashi/style/colors.dart';

class BigSelectButton extends StatelessWidget {
  const BigSelectButton({
    required this.onTap,
    required this.text,
    required this.iconChild,
    super.key,
    this.style,
    this.circularSize,
    this.backgroundColor = ColorName.primaryBase, //デフォルトカラー
    this.foregroundColor,
    this.side = BorderSide.none,
    this.isWithWidget = false,
    this.padding,
    this.elevation,
    this.shadowColor,
    this.isMini = false,
    this.isBottomNavigationBar = false,
    this.circularColor,
    this.isCircular = false,
    this.isFittedBox = false,
    this.isViewInsetsBottom = false,
    this.childWidget,
  });

  final String? text;
  final TextStyle? style;
  final double? circularSize;
  final double? elevation;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? shadowColor;
  final Color? circularColor;
  final BorderSide side;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry? padding;
  final Widget? childWidget;
  final bool isMini;
  final bool isBottomNavigationBar;
  final bool isCircular;
  final bool isFittedBox;
  final bool isViewInsetsBottom;
  final bool isWithWidget;
  final Widget? iconChild;

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: onTap,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.25,
              color: backgroundColor,
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.height * 0.25,
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(child: iconChild),
                          const Padding(padding: EdgeInsets.only(bottom: 11)),
                          Text(
                            text!,
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.25,
                    color: Colors.white.withOpacity(0.5),
                    child: const Icon(
                      Icons.chevron_right_sharp,
                      size: 100,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
}
