import 'package:flutter/material.dart';
import 'package:ink_estimator/core/constants/constants.dart';
import 'package:ink_estimator/model/content_model.dart';
import 'package:ink_estimator/view/widgets/cards/card_measurement.dart';
import 'package:ink_estimator/view_model/content_view_model.dart';
import 'package:provider/provider.dart';

class BoxCards extends StatefulWidget {
  const BoxCards({super.key});

  @override
  State<BoxCards> createState() => _BoxCardsState();
}

class _BoxCardsState extends State<BoxCards> {
  @override
  Widget build(BuildContext context) {
    List<ContentModel> cardsParameters =
        Provider.of<ContentViewModel>(context, listen: false)
            .getCardsParameters(context);
    return Column(
      children: [
        ...List.generate(
          cardsParameters.length,
          (index) => Padding(
            padding: EdgeInsets.only(bottom: Constants.spacings.spacing24),
            child: CardMeasurement(
                label: cardsParameters[index].label,
                image: cardsParameters[index].image),
          ),
        )
      ],
    );
  }
}
