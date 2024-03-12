import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../domain/item.dart';

class AttractionItemWidget extends StatelessWidget {
  final AttractionItem item;

  AttractionItemWidget({required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        clipBehavior: Clip.hardEdge,
        child: Column(//add this
            children: <Widget>[
          AspectRatio(
            aspectRatio: 1.0,
            child: Image.network(item.imageUrl, fit: BoxFit.cover),
          ),
          Container(
            padding: EdgeInsets.all(10.0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Text(item.description),
              Padding(
                  padding: EdgeInsets.only(top: 4.0),
                  child: Row(children: [
                    const Icon(Icons.location_on, size: 16),
                    SelectableText(item.geoLocation)
                  ])),
            ]),
          ),
        ]),
      ),
    );
  }
}
