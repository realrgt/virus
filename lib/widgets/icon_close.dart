import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vogu/util/svg_assets.dart';

class CrossIcon extends StatelessWidget {

  final double paddingRight;

  const CrossIcon({Key key, this.paddingRight = 5.0}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: Padding(
        padding: EdgeInsets.only(right: paddingRight),
        child: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: SvgPicture.asset(
            ICON_CLOSE,
            fit: BoxFit.cover,
            width: 32.0,
          ),
        ),
      ),
    );
  }
}
