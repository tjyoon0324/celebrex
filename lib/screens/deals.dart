import 'package:celebrex/screens/widgets/deal_item.dart';
import 'package:flutter/material.dart';

import 'models/data.dart';
import 'models/deal.dart';

class DealsPage extends StatefulWidget {
  final List<Data> dataList;
  final List<Deal> deals = [
    Deal.fromJsonBody("{\"id\":\"1\",\"data_type\":\"covidVaccinationCert\"}"),
  ];
  Map<String, List<Data>> dealIdToDataList = {};

  DealsPage({
    super.key,
    required this.dataList,
  }) {
    Map<String, List<Deal>> dataTypeToDeals = {};

    for (var deal in deals) {
      var deals = dataTypeToDeals[deal.dataType] ?? [];
      deals.add(deal);
      dataTypeToDeals[deal.dataType] = deals;
    }

    for (var data in dataList) {
      var deals = dataTypeToDeals[data.type] ?? [];
      for (var deal in deals) {
        var dataList = dealIdToDataList[deal.id] ?? [];
        dataList.add(data);
        dealIdToDataList[deal.id] = dataList;
      }
    }
  }

  @override
  State createState() {
    return _DealsPageState();
  }
}

class _DealsPageState extends State<DealsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
              child: Padding(
                padding: EdgeInsets.only(left: 16, right: 16, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text("Deals", style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
                    Container(
                      padding: EdgeInsets.only(left: 8, right: 8, top: 2, bottom: 2),
                      height: 30,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.blue[50],
                      ),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.refresh, color: Colors.blue, size: 20),
                          // SizedBox(width: 2),
                          // Text("Refresh", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 16, left: 16, right: 16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search...",
                  hintStyle: TextStyle(color: Colors.grey.shade600),
                  prefixIcon: Icon(Icons.search, color: Colors.grey.shade600, size: 20),
                  filled: true,
                  fillColor: Colors.grey.shade100,
                  contentPadding: EdgeInsets.all(8),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide(
                      color: Colors.grey.shade100,
                    ),
                  ),
                ),
              ),
            ),
            ListView.builder(
              itemCount: widget.deals.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return DealItem(
                    deal: widget.deals[index],
                    dataList: widget.dealIdToDataList[widget.deals[index].id]!,
                );
              },
            ),
          ],
        ),
      )
    );
  }
}