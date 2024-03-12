import 'package:flutter/material.dart';
import 'package:your_trip_planner/screens/routes/domain/item.dart';
import 'package:your_trip_planner/screens/routes/views/route_item.dart';

class MyRoutesScreen extends StatefulWidget {
  const MyRoutesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyRoutesScreenState();
  }
}

class MyRoutesScreenState extends State<MyRoutesScreen> {
  List<RouteItem> items = [
    RouteItem(
      city: "New York",
      startDate: "12 may 2023",
      endDate: "14 august 2024",
      imageUrl:
      "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSbFce6-vvQMUXsMdk4sUhHWEFgdo2ivkJp0zkxWeDF3fYd7rPQOdaSJTMpc3zJCuTXM8F8e6v_5dnrnTMT1IKlX24c28hoGtxEIaZsKg",
    ),
    RouteItem(
      city: "New York",
      startDate: "12 may 2023",
      endDate: "14 august 2024",
      imageUrl:
      "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSbFce6-vvQMUXsMdk4sUhHWEFgdo2ivkJp0zkxWeDF3fYd7rPQOdaSJTMpc3zJCuTXM8F8e6v_5dnrnTMT1IKlX24c28hoGtxEIaZsKg",
    ),
    RouteItem(
      city: "New York",
      startDate: "12 may 2023",
      endDate: "14 august 2024",
      imageUrl:
      "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSbFce6-vvQMUXsMdk4sUhHWEFgdo2ivkJp0zkxWeDF3fYd7rPQOdaSJTMpc3zJCuTXM8F8e6v_5dnrnTMT1IKlX24c28hoGtxEIaZsKg",
    ),
    RouteItem(
      city: "New York",
      startDate: "12 may 2023",
      endDate: "14 august 2024",
      imageUrl:
      "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSbFce6-vvQMUXsMdk4sUhHWEFgdo2ivkJp0zkxWeDF3fYd7rPQOdaSJTMpc3zJCuTXM8F8e6v_5dnrnTMT1IKlX24c28hoGtxEIaZsKg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("My saved routes")),
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            children: items.map((item) =>
                Padding(padding: EdgeInsets.symmetric(vertical: 4.0),
                    child: RouteItemWidget(item: item))
            ).toList()
        )
    );
  }
}
