class Meal {
  final String category;
  final String imgsource;
  final String titleDia;
  final String titleCurred;
  final String titleNoDia;

  const Meal({
    required this.category,
    required this.imgsource,
    required this.titleDia,
    required this.titleCurred,
    required this.titleNoDia,
  });

  static Meal fromJson(Map<String, dynamic> json) => Meal(
        category: json['category'] as String,
        imgsource: json['imgsource'] as String,
        titleDia: json['title_dia'] as String,
        titleCurred: json['title_curred'] as String,
        titleNoDia: json['title_no_dia'] as String,
      );
}
