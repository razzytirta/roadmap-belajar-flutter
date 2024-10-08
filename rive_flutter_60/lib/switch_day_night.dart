import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class SwitchDaytNight extends StatefulWidget {
  const SwitchDaytNight({super.key});

  @override
  State<SwitchDaytNight> createState() => _SwitchDaytNightState();
}

class _SwitchDaytNightState extends State<SwitchDaytNight> {
  int state = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: GestureDetector(
        onTap: () {
          if (state == 0) {
            setState(() {
              state = 1;
            });
          } else if (state == 2) {
            setState(() {
              state = 3;
            });
          }
        },
        child: FlareActor(
          "assets/switch_daytime.flr",
          animation: (state == 0)
              ? "night_idle"
              : (state == 1)
                  ? "switch_day"
                  : (state == 2)
                      ? "day_idle"
                      : "switch_night",
          callback: (animationName) {
            if (animationName == "switch_day") {
              setState(() {
                state = 2;
              });
            } else if (animationName == "switch_night") {
              setState(() {
                state = 0;
              });
            }
          },
        ),
      ),
    );
  }
}
