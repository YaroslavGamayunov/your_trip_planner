import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:your_trip_planner/screens/cities/domain/item.dart';
import 'package:your_trip_planner/screens/cities/views/city_item.dart';

class CitiesScreen extends StatefulWidget {
  const CitiesScreen({super.key});

  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  List<CityItem> allCities = [];
  List<CityItem> displayedCities = [];
  bool isLoading = false;

  @override
  void initState() {
    isLoading = true;
    loadAllCitiesFuture().then((cities) {
      setState(() {
        isLoading = false;
        allCities = List.from(cities);
        displayedCities = List.from(allCities);
      });
    });
    super.initState();
  }

  Future<List<CityItem>> loadAllCitiesFuture() async {
    CollectionReference users = FirebaseFirestore.instance.collection('cities');
    QuerySnapshot snapshot = await users.get();
    return snapshot.docs
        .map((doc) => CityItem(
            name: doc["name"],
            description: doc["description"],
            imageUrl: doc["imageUrl"],
            id: doc["id"]))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Find cities to visit")),
        body: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                createTopSliverAppBar(),
                createSearchSliverAppBar()
              ];
            },
            body: buildCitiesList()));
  }

  SliverAppBar createTopSliverAppBar() {
    return SliverAppBar(
      expandedHeight: 240.0,
      floating: false,
      flexibleSpace: FlexibleSpaceBar(
          centerTitle: true,
          background: Container(
              padding: const EdgeInsets.all(32.0),
              alignment: Alignment.bottomCenter,
              child: Text(
                "Choose your next destination!",
                style: Theme.of(context).textTheme.displaySmall,
              ))),
    );
  }

  SliverAppBar createSearchSliverAppBar() {
    return SliverAppBar(
        pinned: true,
        title: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          height: 40,
          child: SearchBar(
              onChanged: (query) {
                if (query.isEmpty) {
                  setState(() {
                    displayedCities = List.from(allCities);
                  });
                } else {
                  setState(() {
                    displayedCities = allCities
                        .where(
                            (item) => item.name.toLowerCase().startsWith(query))
                        .toList();
                  });
                }
              },
              leading: const Icon(Icons.search)),
        ));
  }

  Widget buildCitiesList() {
    if (isLoading) {
      return const Center(child: CircularProgressIndicator());
    }
    return Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
        child: ListView(
            children: displayedCities
                .map((item) => Padding(
                    child: CityItemWidget(item: item),
                    padding: EdgeInsets.symmetric(vertical: 10.0)))
                .toList()));
  }
}
