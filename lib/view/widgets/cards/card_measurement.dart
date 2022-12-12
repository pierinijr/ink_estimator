import 'package:flutter/material.dart';
import 'package:ink_estimator/core/constants/constants.dart';
import 'package:ink_estimator/model/room_model.dart';
import 'package:ink_estimator/themes/colors.dart';
import 'package:ink_estimator/view/widgets/label/label_h2.dart';
import 'package:ink_estimator/view/widgets/modal/modal_card.dart';
import 'package:ink_estimator/view_model/room_view_model.dart';
import 'package:provider/provider.dart';

class CardMeasurement extends StatefulWidget {
  const CardMeasurement(
      {super.key,
      required this.index,
      required this.image,
      required this.label});

  final int index;
  final String image;
  final String label;

  @override
  State<CardMeasurement> createState() => _CardMeasurementState();
}

class _CardMeasurementState extends State<CardMeasurement> {
  @override
  Widget build(BuildContext context) {
    RoomViewModel roomViewModel = context.watch<RoomViewModel>();
    RoomModel model = roomViewModel.listData.firstWhere(
        (element) => element.index == widget.index,
        orElse: () => RoomModel(index: widget.index));

    return GestureDetector(
      onTap: () => {
        Provider.of<RoomViewModel>(context, listen: false)
            .setSelectedCard(widget.index),
        showModal(context)
      },
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
                          LabelH2(
                              label: model.infos,
                              fontWeightType: FontWeight.w400),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(right: Constants.spacings.spacing12),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          LabelH2(
                              label: "${model.area.toStringAsFixed(2)}m²", 
                              fontWeightType: FontWeight.w700),
                          LabelH2(
                              label: model.dimensions,
                              fontWeightType: FontWeight.w400),
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
