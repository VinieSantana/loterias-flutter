import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Raffle {

  static const MEGA_SENA = 1;
  static const LOTOMANIA = 2;
  static const QUINA = 3;
  static const TIMEMANIA = 4;
  static const LOTOFACIL = 5;

  final int raffleType;
  final String raffleNumber;
  final String date;
  final List results;

  Raffle({this.raffleType, this.raffleNumber, this.date, this.results});

  factory Raffle.fromJson(Map<String, dynamic> json) {
    return Raffle(
      raffleType: json['raffleType'],
      raffleNumber: json['raffleNumber'],
      date: json['date'],
      results: json['results'],
    );
  }

  Future<List<Raffle>> fetchRaffle() async {
    final response = await http
        .get("https://run.mocky.io/v3/6b9ed2c9-40a0-47d3-a525-c2ade5de0554");
    if (response.statusCode == 200) {
      Iterable l = json.decode(response.body);
      List<Raffle> raffles = null;
      raffles = l.map((i) => Raffle.fromJson(i)).toList();

      return raffles;
    } else {
      throw Exception('Failed to load data');
    }
  }

  String getRaffleLogo(int raffleType) {
    switch (raffleType) {
      case MEGA_SENA:
        return "assets/mega_sena_logo.png";
        break;
      case LOTOMANIA:
        return "assets/lotomania_logo.png";
        break;
      case QUINA:
        return "assets/quina_logo.png";
        break;
      case TIMEMANIA:
        return "assets/timemania_logo.png";
        break;
      case LOTOFACIL:
        return "assets/lotofacil_logo.png";
        break;
      default:
        return "assets/logo_secondary.png";
    }
  }

  getLayoutColors(int raffleType) {
    switch (raffleType) {
      case MEGA_SENA:
        return {
          "circleColor": 0xFF209869,
          "barColor": 0xFF209869,
          "textColor": 0xFFFFFFFF
        };
        break;
      case LOTOFACIL:
        return {
          "textColor": 0xFF930989,
          "barColor": 0xFF930989,
          "circleColor": 0xFFFFFFFF
        };
        break;
      case QUINA:
        return {
          "circleColor": 0xFF260085,
          "barColor": 0xFF260085,
          "textColor": 0xFFFFFFFF
        };
        break;
      case LOTOMANIA:
        return {
          "textColor": 0xFFF78100,
          "barColor": 0xFFF78100,
          "circleColor": 0xFFFFFFFF
        };
        break;
      case TIMEMANIA:
        return {
          "textColor": 0xFF049645,
          "circleColor": 0xFFFFF600,
          "barColor": 0xFF049645
        };
        break;
      default:
        return {
          "circleColor": 0xFF058CE1,
          "barColor": 0xFF058CE1,
          "textColor": 0xFFFFFFFF
        };
    }
  }
}
