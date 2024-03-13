import 'package:flutter/material.dart';

import '../../route/domain/item.dart';
import 'package:intl/intl.dart';

import '../../route/views/route_screen.dart';

class RouteItemWidget extends StatelessWidget {
  final RouteItem item;

  const RouteItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    String startDate = DateFormat.yMMMd().format(item.startDate);
    String endDate = DateFormat.yMMMd()
        .format(item.startDate.add(Duration(days: item.days.length)));
    return InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => RouteScreen(route: item)));
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(item.cityName,
                  style: Theme.of(context).textTheme.titleMedium),
              Text("$startDate - $endDate")
            ])));
  }
}
