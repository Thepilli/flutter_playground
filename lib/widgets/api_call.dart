import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SvatekWidget extends StatefulWidget {
  const SvatekWidget({super.key});

  @override
  _SvatekWidgetState createState() => _SvatekWidgetState();
}

class _SvatekWidgetState extends State<SvatekWidget> {
  Svatek? svatek;

  @override
  void initState() {
    super.initState();
    fetchSvatek();
  }

  Future<void> fetchSvatek() async {
    final response = await http.get(Uri.parse('https://svatkyapi.cz/api/day'));
    if (response.statusCode == 200) {
      final jsonBody = json.decode(response.body);
      final svatek = Svatek.fromJson(jsonBody);
      setState(() {
        this.svatek = svatek;
      });
    } else {
      throw Exception('Failed to fetch svatek');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: svatek != null
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Date: ${svatek!.date}'),
                  Text('Day Number: ${svatek!.dayNumber}'),
                  Text('Day in Week: ${svatek!.dayInWeek}'),
                  Text('Month Number: ${svatek!.monthNumber}'),
                  Text('Year: ${svatek!.year}'),
                  Text('Name: ${svatek!.name}'),
                  Text('Is Holiday: ${svatek!.isHoliday}'),
                ],
              )
            : const CircularProgressIndicator(),
      ),
    );
  }
}

class Svatek {
  Svatek({
    required this.date,
    required this.dayNumber,
    required this.dayInWeek,
    required this.monthNumber,
    required this.year,
    required this.name,
    required this.isHoliday,
  });

  String date;
  String dayNumber;
  String dayInWeek;
  String monthNumber;
  String year;
  String name;
  bool isHoliday;

  static Svatek fromJson(Map<String, dynamic> json) => Svatek(
        date: json["date"] as String,
        dayNumber: json["dayNumber"] as String,
        dayInWeek: json["dayInWeek"] as String,
        monthNumber: json["monthNumber"] as String,
        year: json["year"] as String,
        name: json["name"] as String,
        isHoliday: json["isHoliday"] as bool,
      );

  Map<String, dynamic> toJson() => {
        "date": date,
        "dayNumber": dayNumber,
        "dayInWeek": dayInWeek,
        "monthNumber": monthNumber,
        "year": year,
        "name": name,
        "isHoliday": isHoliday,
      };
}
