import 'package:flutter/material.dart';
import 'package:lascade_machine_test/constant/colors.dart';
import 'package:lascade_machine_test/constant/text_theme.dart';

class GalaxiesListWidget extends StatelessWidget {
  const GalaxiesListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), color: shadowColor),
              child: const Icon(
                Icons.ac_unit_rounded,
                color: Colors.blueAccent,
                size: 30,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Andromeda",
              style: font1,
            )
          ],
        )
      ],
    );
  }
}
