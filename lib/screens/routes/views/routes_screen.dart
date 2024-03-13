import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:your_trip_planner/screens/routes/views/route_item.dart';

import '../../route/domain/item.dart';

class MyRoutesScreen extends StatefulWidget {
  const MyRoutesScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return MyRoutesScreenState();
  }
}

class MyRoutesScreenState extends State<MyRoutesScreen> {
  final Stream<QuerySnapshot> routesStream = FirebaseFirestore.instance
      .collection("/users/${FirebaseAuth.instance.currentUser?.uid}/routes")
      .snapshots();

  @override
  void initState() {
    super.initState();
  }

  List<RouteItem> getRoutesFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc) {
      Iterable daysIterable = json.decode(doc["days"]);
      List<List<String>> days =
          daysIterable.map((e) => List<String>.from(e)).toList();
      return RouteItem(
          cityName: doc["cityName"],
          cityId: doc["cityId"],
          startDate: (doc["startDate"] as Timestamp).toDate(),
          days: days,
          id: doc.id);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("My saved routes")),
        body: buildRoutesList());
  }

  Widget buildRoutesList() {
    return StreamBuilder<QuerySnapshot>(
        stream: routesStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting ||
              snapshot.hasError) {
            print("has error!!! :${snapshot.hasError}");
            return const Center(child: CircularProgressIndicator());
          }

          final items = getRoutesFromSnapshot(snapshot.requireData);

          return ListView(
              children:
                  items.map((item) => RouteItemWidget(item: item)).toList());
        });
  }
}
