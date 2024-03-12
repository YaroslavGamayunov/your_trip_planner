import 'package:flutter/material.dart';
import 'package:your_trip_planner/screens/cities/domain/item.dart';
import 'package:your_trip_planner/screens/cities/views/city_item.dart';

class CitiesScreen extends StatefulWidget {
  const CitiesScreen({super.key});

  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  List<CityItem> items = [
    CityItem(
        name: "Kostroma",
        description:
            "euifief e ehf efhefbeautiful city beautiful city beautiful citybeautiful citybeautiful city",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSbFce6-vvQMUXsMdk4sUhHWEFgdo2ivkJp0zkxWeDF3fYd7rPQOdaSJTMpc3zJCuTXM8F8e6v_5dnrnTMT1IKlX24c28hoGtxEIaZsKg",
        id: 1,
        attractionsCount: 10),
    CityItem(
        name: "Kostroma",
        description: "beautiful city",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSbFce6-vvQMUXsMdk4sUhHWEFgdo2ivkJp0zkxWeDF3fYd7rPQOdaSJTMpc3zJCuTXM8F8e6v_5dnrnTMT1IKlX24c28hoGtxEIaZsKg",
        id: 1,
        attractionsCount: 10),
    CityItem(
        name: "Kostroma",
        description:
            "beautiful city beautiful city beautiful citybeautiful citybeautiful city",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSbFce6-vvQMUXsMdk4sUhHWEFgdo2ivkJp0zkxWeDF3fYd7rPQOdaSJTMpc3zJCuTXM8F8e6v_5dnrnTMT1IKlX24c28hoGtxEIaZsKg",
        id: 1,
        attractionsCount: 10),
    CityItem(
        name: "Kostroma",
        description: "beautiful city",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSbFce6-vvQMUXsMdk4sUhHWEFgdo2ivkJp0zkxWeDF3fYd7rPQOdaSJTMpc3zJCuTXM8F8e6v_5dnrnTMT1IKlX24c28hoGtxEIaZsKg",
        id: 1,
        attractionsCount: 10),
    CityItem(
        name: "Kostroma",
        description: "beautiful city",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSbFce6-vvQMUXsMdk4sUhHWEFgdo2ivkJp0zkxWeDF3fYd7rPQOdaSJTMpc3zJCuTXM8F8e6v_5dnrnTMT1IKlX24c28hoGtxEIaZsKg",
        id: 1,
        attractionsCount: 10),
    CityItem(
        name: "Kostroma",
        description: "beautiful city",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSbFce6-vvQMUXsMdk4sUhHWEFgdo2ivkJp0zkxWeDF3fYd7rPQOdaSJTMpc3zJCuTXM8F8e6v_5dnrnTMT1IKlX24c28hoGtxEIaZsKg",
        id: 1,
        attractionsCount: 10),
    CityItem(
        name: "Kostroma",
        description: "beautiful city",
        imageUrl:
            "https://encrypted-tbn0.gstatic.com/licensed-image?q=tbn:ANd9GcSbFce6-vvQMUXsMdk4sUhHWEFgdo2ivkJp0zkxWeDF3fYd7rPQOdaSJTMpc3zJCuTXM8F8e6v_5dnrnTMT1IKlX24c28hoGtxEIaZsKg",
        id: 1,
        attractionsCount: 10)
  ];

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      // _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Find cities to visit")),
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[createTopSliverAppBar(), createSearchSliverAppBar()];
        },
        body: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 0.0),
            child: ListView(
                children: items
                    .map((item) => Padding(
                        child: CityItemWidget(item: item),
                        padding: EdgeInsets.symmetric(vertical: 10.0)))
                    .toList())),
      ),
    );
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
          child:
              SearchBar(onChanged: (_) {}, leading: const Icon(Icons.search)),
        ));
  }
}
