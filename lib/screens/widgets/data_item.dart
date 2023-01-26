import 'package:celebrex/screens/data.dart';
import 'package:flutter/material.dart';

import '../models/data.dart';

class DataItem extends StatefulWidget {
  Data data;

  DataItem({
    required this.data,
  });

  @override
  State<StatefulWidget> createState() {
    return _DataItemState();
  }
}

class _DataItemState extends State<DataItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return DataPage(data: widget.data);
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
                              Text("From ${widget.data.from}", style: TextStyle(fontSize: 16)),
                              SizedBox(height: 6),
                              Text(
                                widget.data.type ?? "Unknown",
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