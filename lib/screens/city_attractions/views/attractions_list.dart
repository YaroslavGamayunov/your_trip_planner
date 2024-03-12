import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:your_trip_planner/screens/city_attractions/views/attraction_item.dart';

import '../../cities/domain/item.dart';
import '../domain/item.dart';

class AttractionsList extends StatefulWidget {
  final CityItem city;

  AttractionsList({required this.city});

  @override
  State<StatefulWidget> createState() => _AttractionsListState();
}

class _AttractionsListState extends State<AttractionsList> {
  List<AttractionItem> items = [
    AttractionItem(
        name: "Park",
        description: "Best place to visit",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSbFce6-vvQMUXsMdk4sUhHWEFgdo2ivkJp0zkxWeDF3fYd7rPQOdaSJTMpc3zJCuTXM8F8e6v_5dnrnTMT1IKlX24c28hoGtxEIaZsKg",
        geoLocation: "kskdk dkdkdk"),
    AttractionItem(
        name: "ParkParkParkParkParkParkPark",
        description: "Best place to visit",
        imageUrl:
            "https://1.img-dpreview.com/files/p/TS560x560~forums/62803172/ae5fffae14814b88b8eb7551ef16ea84",
        geoLocation: "kskdk dkdkdk"),
    AttractionItem(
        name: "Park",
        description: "Best place to visit",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSbFce6-vvQMUXsMdk4sUhHWEFgdo2ivkJp0zkxWeDF3fYd7rPQOdaSJTMpc3zJCuTXM8F8e6v_5dnrnTMT1IKlX24c28hoGtxEIaZsKg",
        geoLocation: "kskdk dkdkdk"),
    AttractionItem(
        name: "Park",
        description: "Best place to visit",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSbFce6-vvQMUXsMdk4sUhHWEFgdo2ivkJp0zkxWeDF3fYd7rPQOdaSJTMpc3zJCuTXM8F8e6v_5dnrnTMT1IKlX24c28hoGtxEIaZsKg",
        geoLocation: "kskdk dkdkdk"),
    AttractionItem(
        name: "Park",
        description: "Best place to visit",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSbFce6-vvQMUXsMdk4sUhHWEFgdo2ivkJp0zkxWeDF3fYd7rPQOdaSJTMpc3zJCuTXM8F8e6v_5dnrnTMT1IKlX24c28hoGtxEIaZsKg",
        geoLocation: "kskdk dkdkdk"),
    AttractionItem(
        name: "Park",
        description: "Best place to visit",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSbFce6-vvQMUXsMdk4sUhHWEFgdo2ivkJp0zkxWeDF3fYd7rPQOdaSJTMpc3zJCuTXM8F8e6v_5dnrnTMT1IKlX24c28hoGtxEIaZsKg",
        geoLocation: "kskdk dkdkdk"),
    AttractionItem(
        name: "Park",
        description: "Best place to visit",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSbFce6-vvQMUXsMdk4sUhHWEFgdo2ivkJp0zkxWeDF3fYd7rPQOdaSJTMpc3zJCuTXM8F8e6v_5dnrnTMT1IKlX24c28hoGtxEIaZsKg",
        geoLocation: "kskdk dkdkdk"),
    AttractionItem(
        name: "Park",
        description: "Best place to visit",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSbFce6-vvQMUXsMdk4sUhHWEFgdo2ivkJp0zkxWeDF3fYd7rPQOdaSJTMpc3zJCuTXM8F8e6v_5dnrnTMT1IKlX24c28hoGtxEIaZsKg",
        geoLocation: "kskdk dkdkdk"),
    AttractionItem(
        name: "Park",
        description: "Best place to visit",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSbFce6-vvQMUXsMdk4sUhHWEFgdo2ivkJp0zkxWeDF3fYd7rPQOdaSJTMpc3zJCuTXM8F8e6v_5dnrnTMT1IKlX24c28hoGtxEIaZsKg",
        geoLocation: "kskdk dkdkdk"),
    AttractionItem(
        name: "Park",
        description: "Best place to visit",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSbFce6-vvQMUXsMdk4sUhHWEFgdo2ivkJp0zkxWeDF3fYd7rPQOdaSJTMpc3zJCuTXM8F8e6v_5dnrnTMT1IKlX24c28hoGtxEIaZsKg",
        geoLocation: "kskdk dkdkdk"),
    AttractionItem(
        name: "Park",
        description: "Best place to visit",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSbFce6-vvQMUXsMdk4sUhHWEFgdo2ivkJp0zkxWeDF3fYd7rPQOdaSJTMpc3zJCuTXM8F8e6v_5dnrnTMT1IKlX24c28hoGtxEIaZsKg",
        geoLocation: "kskdk dkdkdk"),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      GridView.count(
        primary: false,
        childAspectRatio: 0.65,
        padding:
            const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 10),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        children:
            items.map((item) => AttractionItemWidget(item: item)).toList(),
      )
    ]);
  }
}
