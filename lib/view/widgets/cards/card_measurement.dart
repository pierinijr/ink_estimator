import 'package:flutter/material.dart';
import 'package:ink_estimator/core/constants/constants.dart';
import 'package:ink_estimator/themes/colors.dart';
import 'package:ink_estimator/view/widgets/label/label_h2.dart';
import 'package:ink_estimator/view/widgets/modal/modal_card.dart';

class CardMeasurement extends StatefulWidget {
  const CardMeasurement({super.key, required this.image, required this.label});

  final String image;
  final String label;

  @override
  State<CardMeasurement> createState() => _CardMeasurementState();
}

class _CardMeasurementState extends State<CardMeasurement> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {showModal(context)},
      child: Container(
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
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(widget.image),
                        alignment: Alignment.bottomRight,
                        fit: BoxFit.scaleDown,
                        filterQuality: FilterQuality.high),
                    color: Colors.transparent,
                    borderRadius: const BorderRadius.all(Radius.circular(15))),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(vertical: Constants.spacings.spacing16),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.70,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding:
                          EdgeInsets.only(left: Constants.spacings.spacing4),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          LabelH2(
                              label: widget.label,
                              fontWeightType: FontWeight.w700),
                          const LabelH2(
                              label: "1 porta e 1 janela",
                              fontWeightType: FontWeight.w300),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(right: Constants.spacings.spacing12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          LabelH2(
                              label: "100m2", fontWeightType: FontWeight.w700),
                          LabelH2(
                              label: "10 X 10",
                              fontWeightType: FontWeight.w300),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

void showModal(BuildContext context) {
  showModalBottomSheet(
      context: context,
      isScrollControlled: true, // only work on showModalBottomSheet function
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40), topRight: Radius.circular(40)),
      ),
      builder: (BuildContext context) => Padding(
            padding: MediaQuery.of(context).viewInsets,
            child: const ModalCard(),
          ));
}
