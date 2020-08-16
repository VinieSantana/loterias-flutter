import 'package:VinieSantanaLoterias/custom_scaffold.dart';
import 'package:VinieSantanaLoterias/home.dart';
import 'package:flutter/material.dart';

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
    var circleColor;
    var textColor;
    var barColor;

    switch (raffleType) {
      case Home.MEGA_SENA:
        circleColor = 0xFF209869;
        barColor = 0xFF209869;
        textColor = 0xFFFFFFFF;
        break;
      case Home.LOTOFACIL:
        textColor = 0xFF930989;
        barColor = 0xFF930989;
        circleColor = 0xFFFFFFFF;
        break;
      case Home.QUINA:
        circleColor = 0xFF260085;
        barColor = 0xFF260085;
        textColor = 0xFFFFFFFF;
        break;
      case Home.LOTOMANIA:
        textColor = 0xFFF78100;
        barColor = 0xFFF78100;
        circleColor = 0xFFFFFFFF;
        break;
      case Home.TIMEMANIA:
        textColor = 0xFF049645;
        circleColor = 0xFFFFF600;
        barColor = 0xFF049645;
        break;
      default:
        circleColor = 0xFF058CE1;
        barColor = 0xFF058CE1;
        textColor = 0xFFFFFFFF;
    }

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
                  color: Color(circleColor),
                  shape: BoxShape.circle,
                ),
              )),
          Text(
            result[i],
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(textColor)),
          )
        ],
      ));
    }
    return CustomScaffold(
      "Resultados do sorteio",
      Color(barColor),
      Column(
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
