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

  static Svatek fromJson(json) => Svatek(
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
