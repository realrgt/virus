import 'package:flutter/material.dart';
import 'package:vogu/util/default_colors.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class PurpleWave extends StatelessWidget {
  final MaskFilter _blur = null;

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
