import 'package:flutter/material.dart';

import 'models/data.dart';

class DataPage extends StatefulWidget {
  final Data data;

  const DataPage({
    super.key,
    required this.data
  });

  @override
  State createState() {
    return _DataPageState();
  }
}

class _DataPageState extends State<DataPage> {
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
                      Text("From ${widget.data.from}", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                    ],
                  )
                ),
                Icon(Icons.settings, color: Colors.black54),
              ],
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(widget.data.body),
          ],
        )
      )
    );
  }
}