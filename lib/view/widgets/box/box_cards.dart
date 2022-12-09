import 'package:flutter/material.dart';
import 'package:ink_estimator/core/constants/constants.dart';
import 'package:ink_estimator/view/widgets/cards/card_measurement.dart';

class BoxCards extends StatefulWidget {
  const BoxCards({super.key});

  @override
  State<BoxCards> createState() => _BoxCardsState();
}

class _BoxCardsState extends State<BoxCards> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ...List.generate(
          4,
          (index) => Padding(
            padding: EdgeInsets.only(bottom: Constants.spacings.spacing24),
            child: GestureDetector(
              onTap: () => {print("wow $index")},
              child: const CardMeasurement()
            ),
          ),
        )
        
      ],
    );
  }
}