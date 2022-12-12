import 'package:flutter/material.dart';
import 'package:ink_estimator/core/constants/constants.dart';
import 'package:ink_estimator/languages/generated/app_localizations.dart';
import 'package:ink_estimator/model/ink_model.dart';
import 'package:ink_estimator/themes/colors.dart';
import 'package:ink_estimator/view/widgets/label/label_h2.dart';
import 'package:ink_estimator/view_model/room_view_model.dart';
import 'package:provider/provider.dart';

class TableResult extends StatefulWidget {
  const TableResult({super.key});

  @override
  State<TableResult> createState() => _TableResultState();
}

class _TableResultState extends State<TableResult> {
  @override
  Widget build(BuildContext context) {
    InkModel? result =
        Provider.of<RoomViewModel>(context, listen: false).inkQuantity;

    if (result != null) {
      return Table(
        border: TableBorder(
          top: _tableDefaultStyle(),
          bottom: _tableDefaultStyle(),
          left: _tableDefaultStyle(),
          right: _tableDefaultStyle(),
          horizontalInside: _tableDefaultStyle(),
          verticalInside: _tableDefaultStyle(),
          borderRadius: const BorderRadius.all(Radius.circular(10))
        ),
        children: [
          _criarLinhaTable([AppLocalizations.of(context)!.cans, AppLocalizations.of(context)!.quantity]),
          if (result.cans18000 > 0) _criarLinhaTable(["18 litros", result.cans18000.toString()]),
          if (result.cans3600 > 0) _criarLinhaTable(["3,6 litros", result.cans3600.toString()]),
          if (result.cans2500 > 0) _criarLinhaTable(["2,5 litros", result.cans2500.toString()]),
          if (result.cans500 > 0) _criarLinhaTable(["0,5 litros", result.cans500.toString()]),
        ],
      );
    }
    return const SizedBox();
  }
}

_criarLinhaTable(List<String> listInfo) {
  return TableRow(
    children: listInfo.map((name) {
      return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(Constants.spacings.spacing6),
        child: LabelH2(
          label: name,
        ),
      );
    }).toList(),
  );
}

BorderSide _tableDefaultStyle() {
  return const BorderSide(
    color: AppColors.primaryColor,
    style: BorderStyle.solid,
    width: 1.0,
  );
}
