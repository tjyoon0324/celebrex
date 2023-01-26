import 'package:celebrex/screens/deal.dart';
import 'package:flutter/material.dart';

import '../models/deal.dart';

class DealItem extends StatefulWidget {
  Deal deal;

  DealItem({
    required this.deal,
  });

  @override
  State<StatefulWidget> createState() {
    return _DealItemState();
  }
}

class _DealItemState extends State<DealItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DealPage(deal: widget.deal);
        }));
      },
      child: Container(
        padding: EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
        child: Row(
          children: <Widget>[
            Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: Container(
                          color: Colors.transparent,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text("Deal ${widget.deal.id}", style: TextStyle(fontSize: 16)),
                              SizedBox(height: 6),
                              Text(
                                "Yo, man",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          )
                        )
                    ),
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}