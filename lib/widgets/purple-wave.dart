import 'package:flutter/material.dart';
import 'package:vogu/util/default_colors.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class PurpleWave extends StatelessWidget {
  MaskFilter _blur;
  final List<MaskFilter> _blurs = [
    null,
    MaskFilter.blur(BlurStyle.normal, 10),
    MaskFilter.blur(BlurStyle.inner, 10),
    MaskFilter.blur(BlurStyle.outer, 10),
    MaskFilter.blur(BlurStyle.solid, 16.0)
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: WaveWidget(
        config: CustomConfig(
          gradients: [
            [PURPLE_DEEP, PURPLE_DEEP.withOpacity(0.1)],
            [PURPLE_DEEP, PURPLE_DEEP.withOpacity(0.1)],
            [PURPLE_DEEP, PURPLE_DEEP.withOpacity(0.1)],
          ],
          durations: [49000, 60000, 30000],
          heightPercentages: [0.25, 0.15, 0.20],
          blur: _blur,
          gradientBegin: Alignment.topLeft,
          gradientEnd: Alignment.bottomRight,
        ),
        backgroundColor: Colors.white,
        size: Size(MediaQuery.of(context).size.width, 178.5),
      ),
    );
  }
}
