import 'package:your_trip_planner/screens/city_attractions/domain/item.dart';

class RouteItem {
  final String cityName;
  final DateTime startDate;
  List<List<AttractionItem>> days;

  RouteItem(
      {required this.cityName, required this.startDate, required this.days});
}
