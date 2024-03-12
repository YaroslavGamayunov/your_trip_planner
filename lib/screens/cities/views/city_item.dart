import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:your_trip_planner/screens/cities/domain/item.dart';
import 'package:your_trip_planner/screens/city_attractions/views/city_attractions_screen.dart';

class CityItemWidget extends StatelessWidget {
  final CityItem item;

  const CityItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () => {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CityAttractionsScreen(item: item)))
            },
        child: Stack(children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(32.0),
              child: Image.network(
                item.imageUrl,
              )),
          Positioned(
            bottom: 0,
            child: Container(
                child: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.zero,
                  topRight: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                  topLeft: Radius.circular(16.0)),
              clipBehavior: Clip.hardEdge,
              child: Container(
                  color: Theme.of(context).primaryColorLight,
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(item.name,
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(fontWeight: FontWeight.bold)),
                      Text(item.description, overflow: TextOverflow.ellipsis),
                      Text(item.attractionsCount.toString())
                    ],
                  )),
            )),
          )
        ]));
  }
}
