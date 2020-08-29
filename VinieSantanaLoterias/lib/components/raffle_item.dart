import 'package:VinieSantanaLoterias/features/raffle_detail.dart';
import 'package:flutter/material.dart';
import 'package:VinieSantanaLoterias/models/raffle_model.dart';

class RaffleItem extends StatelessWidget {
  const RaffleItem({
    Key key,
    @required this.date,
    @required this.raffleNumber,
    @required this.raffleType,
    @required this.results,
  }) : super(key: key);

  final String raffleNumber;
  final String date;
  final List results;
  final int raffleType;

  @override
  Widget build(BuildContext context) {
    String logo = Raffle().getRaffleLogo(raffleType);

    return FlatButton(
      onPressed: () {
        Navigator.push(
            context,
            new MaterialPageRoute(
                builder: (context) => RaffleDetail(
                    logo, raffleNumber, date, results, raffleType)));
      },
      child: Card(
        elevation: 3,
        child: ListTile(
          leading: Image.asset(logo, height: 30),
          title: Text("Sorteio: $raffleNumber"),
          subtitle: Text("Data: $date"),
          isThreeLine: true,
        ),
      ),
    );
  }
}
