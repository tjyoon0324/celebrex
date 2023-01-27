import 'package:celebrex/screens/deal_data_list.dart';
import 'package:flutter/material.dart';

import 'models/data.dart';
import 'models/deal.dart';

class DealPage extends StatefulWidget {
  final Deal deal;
  final List<Data> dataList;

  const DealPage({
    super.key,
    required this.deal,
    required this.dataList,
  });

  @override
  State createState() {
    return _DealPageState();
  }
}

class _DealPageState extends State<DealPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          flexibleSpace: SafeArea(
            child: Container(
              padding: EdgeInsets.only(right: 16),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                  SizedBox(width: 2),
                  Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("Deal ${widget.deal.id}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                        ],
                      )
                  ),
                  Icon(Icons.settings, color: Colors.black54),
                ],
              ),
            ),
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(widget.deal.body),
                    ],
                  )
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) {
                    return DealDataListPage(deal: widget.deal, dataList: widget.dataList);
                  }),
                );
              },
              child: Text("Provide your data to this deal"),
            ),
            SizedBox(height: 15),
          ],
        )
    );
  }
}