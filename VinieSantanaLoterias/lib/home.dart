import 'package:VinieSantanaLoterias/custom_scaffold.dart';
import 'package:VinieSantanaLoterias/raffle_detail.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String city;
  final String name;
  static const MEGA_SENA = 1;
  static const LOTOMANIA = 2;
  static const QUINA = 3;
  static const TIMEMANIA = 4;
  static const LOTOFACIL = 5;

  Home(this.name, this.city);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      "Últimos Resultados",
      null,
      Container(
        child: Column(
          children: [
            Container(
                child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Center(
                            child: Image.asset(
                          "assets/logo_secondary.png",
                          width: 80,
                        )),
                        SizedBox(width: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Usuário: $name",
                              textAlign: TextAlign.start,
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            ),
                            Text("Cidade: $city",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14))
                          ],
                        )
                      ],
                    ))),
            Expanded(
                child: ListView(
              children: <Widget>[
                RaffleItem(
                  raffleType: MEGA_SENA,
                  raffleNumber: "2289",
                  date: "13/08/2020",
                  results: MEGA_RESULTS,
                ),
                RaffleItem(
                  raffleType: LOTOMANIA,
                  raffleNumber: "2099",
                  date: "11/08/2020",
                  results: LOTOMANIA_RESULTS,
                ),
                RaffleItem(
                  raffleType: QUINA,
                  raffleNumber: "5539",
                  date: "13/08/2020",
                  results: QUINA_RESULTS,
                ),
                RaffleItem(
                  raffleType: TIMEMANIA,
                  raffleNumber: "1523",
                  date: "13/08/2020",
                  results: TIMEMANIA_RESULTS,
                ),
                RaffleItem(
                  raffleType: LOTOFACIL,
                  raffleNumber: "2289",
                  date: "13/08/2020",
                  results: LOTOFACIL_RESULTS,
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}

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
    var logo;

    switch (raffleType) {
      case Home.MEGA_SENA:
        logo = "assets/mega_sena_logo.png";
        break;
      case Home.LOTOMANIA:
        logo = "assets/lotomania_logo.png";
        break;
      case Home.QUINA:
        logo = "assets/quina_logo.png";
        break;
      case Home.TIMEMANIA:
        logo = "assets/timemania_logo.png";
        break;
      case Home.LOTOFACIL:
        logo = "assets/lotofacil_logo.png";
        break;
      default:
        logo = "assets/logo_secondary.png";
    }

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

const MEGA_RESULTS = ["06", "09", "34", "37", "38", "45"];
const QUINA_RESULTS = ["15", "26", "34", "41", "64"];
const TIMEMANIA_RESULTS = ["21", "45", "51", "53", "62", "64", "75"];
const LOTOFACIL_RESULTS = [
  "02",
  "03",
  "04",
  "05",
  "06",
  "10",
  "11",
  "12",
  "16",
  "19",
  "20",
  "21",
  "22",
  "24",
  "25",
];
const LOTOMANIA_RESULTS = [
  "01",
  "04",
  "19",
  "28",
  "29",
  "31",
  "32",
  "38",
  "40",
  "42",
  "43",
  "46",
  "59",
  "64",
  "80",
  "84",
  "85",
  "86",
  "90",
  "99"
];
