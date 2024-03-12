import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
  List<AttractionItem> items = [];
  bool isLoading = false;

  @override
  void initState() {
    isLoading = true;
    loadAttractionsItems().then((value) {
      SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
        setState(() {
          items = value;
          isLoading = false;
        });
      });
    });
    super.initState();
  }

  Future<List<AttractionItem>> loadAttractionsItems() async {
    CollectionReference attractions =
        FirebaseFirestore.instance.collection('attractions');

    final query = attractions.where('city', isEqualTo: widget.city.id);

    QuerySnapshot snapshot = await query.get();
    return snapshot.docs
        .map((doc) => AttractionItem(
            name: doc["name"],
            description: doc["description"],
            imageUrl: doc["imageUrl"],
            id: doc.id,
            geoLocation: doc["geoLocation"]))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return ListView(children: <Widget>[
      GridView.count(
        primary: false,
        childAspectRatio: 0.5,
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
