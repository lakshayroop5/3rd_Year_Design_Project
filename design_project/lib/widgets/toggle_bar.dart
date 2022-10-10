import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';

class ToggleBar extends StatelessWidget {
  const ToggleBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 20),
          alignment: Alignment.center,
          child: ToggleSwitch(
            minWidth: 90.0,
            minHeight: 70.0,
            initialLabelIndex: 0,
            cornerRadius: 20.0,
            activeBgColor: const [Colors.purple],
            activeFgColor: Colors.white,
            inactiveBgColor: Colors.grey,
            inactiveFgColor: Colors.white,
            borderColor: const [Colors.purple],
            dividerColor: Colors.purple,
            iconSize: 30,
            totalSwitches: 3,
            icons: const [
              Icons.thermostat,
              Icons.water_drop_outlined,
              Icons.lightbulb_outline,
            ],
            onToggle: ((index) {
              print(index);
            }),
          ),
        ),
      ],
    );
  }
}
