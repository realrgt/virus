import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vogu/util/svg_assets.dart';

class CrossIcon extends StatelessWidget {
  final double paddingRight;
  final double paddingTop;
  final double width;
  final Color color;

  const CrossIcon(
      {Key key,
      this.paddingRight = 5.0,
      this.paddingTop = 0.0,
      this.width = 32.0,
      this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.only(right: paddingRight, top: paddingTop),
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: SvgPicture.asset(
              ICON_CLOSE,
              fit: BoxFit.cover,
              width: width,
              color: color,
            ),
          ),
        ),
      ),
    );
  }
}
