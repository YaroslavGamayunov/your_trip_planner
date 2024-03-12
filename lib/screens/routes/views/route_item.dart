import 'package:flutter/material.dart';

import '../domain/item.dart';

class RouteItemWidget extends StatelessWidget {
  final RouteItem item;

  const RouteItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
            height: 50,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16.0),
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                      fit: BoxFit.fitHeight,
                      alignment: FractionalOffset.topCenter,
                      image: NetworkImage(item.imageUrl),
                    )),
                  ),
                ))),
        Padding(
            padding: const EdgeInsets.only(left: 16),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(item.city, style: Theme.of(context).textTheme.titleMedium),
              Text("${item.startDate} - ${item.endDate}"),
            ]))
      ],
    );
  }
}
