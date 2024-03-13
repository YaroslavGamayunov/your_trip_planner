import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../domain/item.dart';

class AttractionItemWidget extends StatelessWidget {
  final AttractionItem item;

  final void Function() onTap;

  AttractionItemWidget({required this.item, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
        aspectRatio: 0.45,
        child: GestureDetector(
          onTap: onTap,
          child: Card(
            clipBehavior: Clip.hardEdge,
            child: Column(//add this
                children: <Widget>[
              AspectRatio(
                aspectRatio: 1.0,
                child: Image.network(item.imageUrl, fit: BoxFit.cover),
              ),
              Flexible(
                child: Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.name,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          Text(item.description),
                          Spacer(),
                          Container(
                              padding: EdgeInsets.only(top: 4.0),
                              child: Row(children: [
                                const Icon(Icons.location_on, size: 16),
                                SelectableText(item.geoLocation)
                              ])),
                        ])),
              ),
            ]),
          ),
        ));
  }
}
