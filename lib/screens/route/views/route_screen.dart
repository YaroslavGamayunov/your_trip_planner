import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:your_trip_planner/screens/city_attractions/views/attraction_item.dart';
import 'package:your_trip_planner/screens/city_attractions/views/attractions_list.dart';
import 'package:your_trip_planner/screens/route/domain/item.dart';

import '../../city_attractions/domain/item.dart';

class RouteScreen extends StatefulWidget {
  final RouteItem route;
  final bool isNewRoute;

  RouteScreen({required this.route}) : isNewRoute = false;

  RouteScreen.newRoute(
      {required String cityName,
      required String cityId,
      required DateTime startDate})
      : route = RouteItem(
            id: UniqueKey().toString(),
            cityId: cityId,
            cityName: cityName,
            startDate: startDate,
            days: [[]]),
        isNewRoute = true;

  @override
  State<StatefulWidget> createState() => _RouteScreenState();
}

class _RouteScreenState extends State<RouteScreen> {
  late RouteItem route;
  bool isChanged = false;
  bool isLoading = false;

  Map<String, AttractionItem> loadedAttractionsById = {};

  @override
  void initState() {
    if (widget.isNewRoute) {
      isChanged = true;
    }
    route = RouteItem.clone(widget.route);
    isLoading = true;
    loadAttractions().then((value) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {
          isLoading = false;
          loadedAttractionsById = value;
        });
      });
    });
    super.initState();
  }

  Future<Map<String, AttractionItem>> loadAttractions() async {
    final toLoad = route.days.expand((element) => element).toSet().toList();
    CollectionReference attractions =
        FirebaseFirestore.instance.collection('attractions');

    if (toLoad.isEmpty) {
      return {};
    }

    final query = attractions.where(FieldPath.documentId, whereIn: toLoad);

    QuerySnapshot snapshot = await query.get();
    final attractionsList = snapshot.docs
        .map((doc) => AttractionItem(
            name: doc["name"],
            description: doc["description"],
            imageUrl: doc["imageUrl"],
            id: doc.id,
            geoLocation: doc["geoLocation"]))
        .toList();
    return {for (var e in attractionsList) e.id: e};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
    );
  }

  Widget buildBody() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView.builder(
        itemCount: route.days.length + 1,
        itemBuilder: (BuildContext context, int index) {
          if (index < route.days.length) {
            DateTime dateOfDay = route.startDate.add(Duration(days: index));
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: EdgeInsets.only(top: 32, left: 16, right: 16),
                      child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("Day ${index + 1}",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(fontWeight: FontWeight.bold)),
                            Spacer(),
                            IconButton(
                                onPressed: () {
                                  deleteDay(index);
                                },
                                icon: Icon(Icons.close))
                          ])),
                  Padding(
                      padding: EdgeInsets.only(left: 16, right: 16),
                      child: Text(DateFormat.yMMMd().format(dateOfDay))),
                  Container(
                      height: 380,
                      child: ListView.builder(
                          padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                          scrollDirection: Axis.horizontal,
                          itemCount: route.days[index].length + 1,
                          itemBuilder: (BuildContext context, int index2) {
                            if (index2 < route.days[index].length) {
                              return buildAttractionItem(index, index2);
                            } else {
                              return AspectRatio(
                                  aspectRatio: 0.45,
                                  child: Center(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          IconButton(
                                              onPressed: () {
                                                onAddAttractionPress(index);
                                              },
                                              style: FilledButton.styleFrom(
                                                  shape: const CircleBorder(),
                                                  backgroundColor:
                                                      Theme.of(context)
                                                          .primaryColorLight),
                                              icon: const Icon(Icons.add)),
                                          Text("Add attraction")
                                        ]),
                                  ));
                            }
                          }))
                ]);
          } else {
            return Padding(
                padding: EdgeInsets.symmetric(vertical: 32),
                child: FilledButton(
                  onPressed: addDay,
                  style: FilledButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColorLight),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add),
                      Text("Add day of trip",
                          style: Theme.of(context)
                              .textTheme
                              .titleMedium
                              ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onPrimary))
                    ],
                  ),
                ));
          }
        });
  }

  AppBar buildAppBar() {
    List<Widget> actions = isChanged
        ? [
            Padding(
                padding: EdgeInsets.only(right: 16.0),
                child: FilledButton(
                    onPressed: saveRoute, child: const Text("Save")))
          ]
        : [];

    return AppBar(title: Text("Trip to ${route.cityName}"), actions: actions);
  }

  Widget buildAttractionItem(int day, int position) {
    AttractionItem item = loadedAttractionsById[route.days[day][position]]!;
    return Stack(children: [
      AttractionItemWidget(onTap: () {}, item: item),
      Positioned(
          top: 4,
          right: 4,
          child: IconButton(
              onPressed: () {
                removeAttraction(day, position);
              },
              icon: const Icon(Icons.close, color: Colors.white),
              style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  backgroundColor:
                      Theme.of(context).canvasColor.withOpacity(0.3))))
    ]);
  }

  void addDay() {
    setState(() {
      isChanged = true;
      route.days.add([]);
    });
  }

  void deleteDay(int day) {
    setState(() {
      isChanged = true;
      route.days.removeAt(day);
    });
  }

  void addAttraction(AttractionItem attractionItem, int day) {
    setState(() {
      isChanged = true;
      loadedAttractionsById[attractionItem.id] = attractionItem;
      route.days[day].add(attractionItem.id);
    });
  }

  void removeAttraction(int day, int position) {
    setState(() {
      isChanged = true;
      route.days[day].removeAt(position);
    });
  }

  void onAddAttractionPress(int day) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => AttractionsList.forSelection(
                  cityId: route.cityId,
                  attractionSelectedListener: (attraction) {
                    addAttraction(attraction, day);
                  },
                )));
  }

  void saveRoute() {
    Navigator.of(context).pop();
    final userId = FirebaseAuth.instance.currentUser?.uid;
    final collection =
        FirebaseFirestore.instance.collection("/users/${userId}/routes");
    collection.doc(route.id).set({
      'cityName': route.cityName,
      'cityId': route.cityId,
      'startDate': route.startDate,
      'days': json.encode(route.days)
    });
  }
}
