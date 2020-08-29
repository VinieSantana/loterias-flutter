import 'package:VinieSantanaLoterias/components/custom_scaffold.dart';
import 'package:VinieSantanaLoterias/components/raffle_item.dart';
import 'package:VinieSantanaLoterias/models/raffle_model.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String city;
  final String name;

  Home(this.name, this.city);
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: "Últimos Resultados",
      barColor: null,
      child: SafeArea(
        child: Container(
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
                                style: TextStyle(
                                    color: Colors.black, fontSize: 14),
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
                  child: FutureBuilder(
                      future: Raffle().fetchRaffle(),
                      builder: (context, item) {
                        if (item.data == null) {
                          return Container(
                            child: Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  CircularProgressIndicator(
                                    backgroundColor: Colors.white,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Buscando Resultados...",
                                    style: TextStyle(color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                          );
                        }

                        return ListView.builder(
                          itemCount: item.data == null ? 0 : item.data.length,
                          itemBuilder: (context, index) {
                            Raffle raffleItem = item.data[index];

                            return RaffleItem(
                              raffleType: raffleItem.raffleType,
                              raffleNumber: raffleItem.raffleNumber,
                              date: raffleItem.date,
                              results: raffleItem.results,
                            );
                          },
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
