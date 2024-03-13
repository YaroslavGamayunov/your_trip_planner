import 'dart:math';

import 'package:flutter/material.dart';
import 'package:your_trip_planner/screens/cities/domain/item.dart';
import 'package:your_trip_planner/screens/cities/views/city_item.dart';
import 'package:your_trip_planner/screens/route/views/route_screen.dart';

import '../../route/domain/item.dart';
import '../domain/item.dart';
import 'attractions_list.dart';

class CityAttractionsScreen extends StatefulWidget {
  final CityItem item;

  const CityAttractionsScreen({required this.item});

  @override
  State<CityAttractionsScreen> createState() => _CityAttractionsScreenState();
}

class _CityAttractionsScreenState extends State<CityAttractionsScreen> {
  double imageCollapsePercent = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () async {
            final DateTime? picked = await showDatePicker(
                helpText: "Choose start day of your trip",
                context: context,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)));

            if (picked != null) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => RouteScreen.newRoute(
                          cityName: widget.item.name,
                          cityId: widget.item.id,
                          startDate: picked)));
            }
          },
          label: const Text("Plan your trip"),
          icon: const Icon(Icons.add)),
      body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [createTopSliver()];
          },
          body: AttractionsList(cityId: widget.item.id)),
    );
  }

  SliverLayoutBuilder createTopSliver() {
    return SliverLayoutBuilder(builder: (BuildContext context, constraints) {
      final scrolled = constraints.scrollOffset > 0;
      final scrollProgress = max(0.0, 1 - constraints.scrollOffset / 240.0);
      return SliverAppBar(
        expandedHeight: 260.0,
        floating: false,
        pinned: true,
        leading: Padding(
          padding: const EdgeInsets.all(4.0),
          child: BackButton(
              style: FilledButton.styleFrom(
                  shape: const CircleBorder(),
                  backgroundColor: Theme.of(context)
                      .colorScheme
                      .background
                      .withOpacity(scrollProgress))),
        ),
        flexibleSpace: FlexibleSpaceBar(
            title: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8.0 * scrollProgress),
                    bottomLeft: Radius.circular(8.0 * scrollProgress)),
                child: Container(
                    color: Theme.of(context)
                        .primaryColorLight
                        .withOpacity(scrollProgress),
                    child: Container(
                        padding: EdgeInsets.all(8 * scrollProgress),
                        child: Text(
                          maxLines: scrollProgress < 0.5 ? 1 : 2,
                          "Attractions in ${widget.item.name}",
                          style: Theme.of(context).textTheme.titleLarge,
                        )))),
            background: Image.network(
              widget.item.imageUrl,
              fit: BoxFit.fill,
            )),
      );
    });
  }
}
