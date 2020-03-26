import 'package:flutter/material.dart';
import 'package:vogu/util/default_colors.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

class PurpleWave extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: WaveWidget(
        config: CustomConfig(
          gradients: [
            [
              PURPLE_DEEP.withOpacity(0.5),
              PURPLE_DEEP.withOpacity(0.7)
            ],
            [
              PURPLE_DEEP.withOpacity(0.5),
              PURPLE_DEEP.withOpacity(0.7)
            ],
            [
              PURPLE_DEEP.withOpacity(0.5),
              PURPLE_DEEP.withOpacity(0.7)
            ],
          ],
          durations: [17000, 15000, 24000],
          heightPercentages: [0.25, 0.15, 0.20],
          blur: MaskFilter.blur(BlurStyle.solid, 10),
          gradientBegin: Alignment.topCenter,
          gradientEnd: Alignment.bottomCenter,
        ),
        size: Size(MediaQuery.of(context).size.width, 178.5),
      ),
    );
  }
}
