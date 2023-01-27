import 'package:celebrex/screens/widgets/data_item.dart';
import 'package:flutter/material.dart';

import 'models/data.dart';
import 'models/deal.dart';

class DealDataListPage extends StatefulWidget {
  final Deal deal;
  final List<Data> dataList;

  const DealDataListPage({
    super.key,
    required this.deal,
    required this.dataList,
  });

  @override
  State createState() {
    return _DealDataListPageState();
  }
}

class _DealDataListPageState extends State<DealDataListPage> {
  Data? selectedData;

  @override
  void initState() {
    selectedData = widget.dataList[0];
  }

  setSelectedData(Data? data) {
    setState(() {
      selectedData = data;
    });
  }

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
                        Text("Select a data for Deal ${widget.deal.id}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                      ],
                    )
                ),
              ],
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              itemCount: widget.dataList.length,
              shrinkWrap: true,
              padding: EdgeInsets.only(top: 16),
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final data = widget.dataList[index];
                return RadioListTile(
                  value: data,
                  groupValue: data,
                  title: Text("From ${data.from}"),
                  subtitle: Text(data.type ?? "Unknown"),
                  onChanged: (currentData) {
                    print("Current Data: ${currentData}");
                    setSelectedData(currentData);
                  },
                  selected: selectedData?.from == data.from && selectedData?.type == data.type, //TODO: refactor this
                  activeColor: Colors.blue,
                );
              },
            ),
          ),
          ElevatedButton(
            onPressed: () {
              print("Selected Data: ${selectedData}");
            },
            child: Text("Provide a data"),
          ),
          SizedBox(height: 15),
        ],
      ),
    );
  }
}