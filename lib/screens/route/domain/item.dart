import 'dart:convert';

class RouteItem {
  final String id;
  final String cityName;
  final String cityId;
  final DateTime startDate;
  List<List<String>> days;

  RouteItem(
      {required this.id,
      required this.cityId,
      required this.cityName,
      required this.startDate,
      required this.days});

  RouteItem.clone(RouteItem other)
      : id = other.id,
        cityId = other.cityId,
        cityName = other.cityName,
        startDate = other.startDate,
        days = [] {
    final encoded = jsonEncode(other.days);
    Iterable daysIterable = json.decode(encoded);
    days = daysIterable.map((e) => List<String>.from(e)).toList();
  }
}
