import 'package:flutter/material.dart';
import 'package:ink_estimator/core/constants/constants.dart';
import 'package:ink_estimator/themes/colors.dart';
import 'package:ink_estimator/view/widgets/label/label_h2.dart';

class CardMeasurement extends StatefulWidget {
  const CardMeasurement({super.key});

  @override
  State<CardMeasurement> createState() => _CardMeasurementState();
}

class _CardMeasurementState extends State<CardMeasurement> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.secondaryColor,
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: EdgeInsets.all(Constants.spacings.spacing12),
            child: Container(
              height: 48, 
              width: 48,
              decoration: const BoxDecoration(
                // image: DecorationImage(
                //   image: AssetImage(screenList[index]['image']),
                //   alignment: Alignment.bottomRight,
                //   fit: BoxFit.cover,
                // ),
                color: AppColors.primaryColor, 
                borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: Constants.spacings.spacing16),
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: Constants.spacings.spacing4),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        LabelH2(label: "Frente", fontWeightType: FontWeight.w700),
                        LabelH2(label: "1 porta e 1 janela", fontWeightType: FontWeight.w300),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: Constants.spacings.spacing12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: const [
                        LabelH2(label: "100m2", fontWeightType: FontWeight.w700),
                        LabelH2(label: "10 X 10", fontWeightType: FontWeight.w300),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}