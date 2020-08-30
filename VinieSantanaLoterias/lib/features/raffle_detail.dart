import 'package:VinieSantanaLoterias/components/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:VinieSantanaLoterias/models/raffle_model.dart';

class RaffleDetail extends StatelessWidget {
  final String logo;
  final String raffleNumber;
  final String date;
  final List result;
  final int raffleType;

  RaffleDetail(
      this.logo, this.raffleNumber, this.date, this.result, this.raffleType);

  @override
  Widget build(BuildContext context) {
    Map colors = Raffle().getLayoutColors(raffleType);
    List<Widget> list = new List<Widget>();
    for (var i = 0; i < result.length; i++) {
      list.add(new Stack(
        alignment: Alignment.center,
        children: [
          Padding(
              padding: EdgeInsets.all(4),
              child: Container(
                width: 50.0,
                height: 50.0,
                decoration: new BoxDecoration(
                  color: Color(colors["circleColor"]),
                  shape: BoxShape.circle,
                ),
              )),
          Text(
            result[i],
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(colors["textColor"])),
          )
        ],
      ));
    }
    return CustomScaffold(
      title: "Resultados do sorteio",
      barColor: Color(colors["barColor"]),
      child: Column(
        children: [
          Image.asset(logo),
          Padding(
              padding: EdgeInsets.all(16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Sorteio: $raffleNumber",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Data: $date",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              )),
          Padding(padding: EdgeInsets.all(16), child: Wrap(children: list))
        ],
      ),
    );
  }
}
