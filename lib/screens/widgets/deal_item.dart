import 'package:celebrex/screens/deal.dart';
import 'package:celebrex/screens/models/data.dart';
import 'package:flutter/material.dart';

import '../models/deal.dart';

class DealItem extends StatefulWidget {
  Deal deal;
  List<Data> dataList;

  DealItem({
    super.key,
    required this.deal,
    required this.dataList,
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
          return DealPage(deal: widget.deal, dataList: widget.dataList);
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
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text("Deal ${widget.deal.id}", style: TextStyle(fontSize: 16)),
                                SizedBox(height: 6),
                                Text(
                                  widget.deal.dataType,
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.grey.shade600,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "${widget.dataList.length}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
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