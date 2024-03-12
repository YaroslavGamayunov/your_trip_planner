import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:your_trip_planner/screens/city_attractions/views/attraction_item.dart';
import 'package:your_trip_planner/screens/route/domain/item.dart';
import 'package:intl/intl.dart';

import '../../city_attractions/domain/item.dart';

class RouteScreen extends StatefulWidget {
  final RouteItem route;

  RouteScreen({required this.route});

  @override
  State<StatefulWidget> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  List<AttractionItem> items = [
    // AttractionItem(
    //     name: "Park",
    //     description: "Best place to visit",
    //     imageUrl:
    //         "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSbFce6-vvQMUXsMdk4sUhHWEFgdo2ivkJp0zkxWeDF3fYd7rPQOdaSJTMpc3zJCuTXM8F8e6v_5dnrnTMT1IKlX24c28hoGtxEIaZsKg",
    //     geoLocation: "kskdk dkdkdk"),
    // AttractionItem(
    //     name: "ParkParkParkParkParkParkPark",
    //     description: "Best place to visit",
    //     imageUrl:
    //         "https://1.img-dpreview.com/files/p/TS560x560~forums/62803172/ae5fffae14814b88b8eb7551ef16ea84",
    //     geoLocation: "kskdk dkdkdk"),
    // AttractionItem(
    //     name: "Park",
    //     description: "Best place to visit",
    //     imageUrl:
    //         "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSbFce6-vvQMUXsMdk4sUhHWEFgdo2ivkJp0zkxWeDF3fYd7rPQOdaSJTMpc3zJCuTXM8F8e6v_5dnrnTMT1IKlX24c28hoGtxEIaZsKg",
    //     geoLocation: "kskdk dkdkdk")
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    for (int i = 0; i < 5; i++) {
      widget.route.days.add(List.from(items));
    }
    return Scaffold(
      appBar: AppBar(title: Text("Trip to ${widget.route.cityName}")),
      body: ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: widget.route.days.length + 1,
          itemBuilder: (BuildContext context, int index) {
            if (index < widget.route.days.length) {
              DateTime dateOfDay =
                  widget.route.startDate.add(Duration(days: index));
              return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(top: 32),
                        child: Text("Day ${index + 1}",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold))),
                    Text(DateFormat.yMMMd().format(dateOfDay)),
                    Container(
                        height: 300,
                        child: ListView.builder(
                            padding: const EdgeInsets.only(top: 16),
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.route.days[index].length + 1,
                            itemBuilder: (BuildContext context, int index2) {
                              if (index2 < widget.route.days[index].length) {
                                return AttractionItemWidget(
                                    item: widget.route.days[index][index2]);
                              } else {
                                return AspectRatio(
                                    aspectRatio: 0.5,
                                    child: Center(
                                      child: IconButton(
                                          onPressed: () {},
                                          style: FilledButton.styleFrom(
                                              shape: const CircleBorder(),
                                              backgroundColor: Theme.of(context)
                                                  .primaryColorLight),
                                          icon: const Icon(Icons.add)),
                                    ));
                              }
                            }))
                  ]);
            } else {
              return Padding(
                  padding: EdgeInsets.symmetric(vertical: 32),
                  child: FilledButton(
                    onPressed: () {},
                    style: FilledButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColorLight),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.add),
                        Text("Add another day of trip")
                      ],
                    ),
                  ));
            }
          }),
    );
  }
}
