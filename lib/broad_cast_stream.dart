import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stream_in_flutter/broad_cast_stream.dart';

class BroadCastStream extends StatefulWidget {
  const BroadCastStream({super.key});

  @override
  State<BroadCastStream> createState() => _BroadCastStreamState();
}

class _BroadCastStreamState extends State<BroadCastStream> {
  int value = 0;

  StreamController<int> streamObject = StreamController<int>();
 late Stream broadcastStream;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

     broadcastStream=streamObject.stream.asBroadcastStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StreamBuilder(
              stream: broadcastStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "Value:" + snapshot.data.toString(),
                    textScaleFactor: 2,
                  );
                } else {
                  return Text(
                    "Value:0 ".toString(),
                    textScaleFactor: 2,
                  );
                }
              }),
        
         StreamBuilder(
              stream: broadcastStream,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(
                    "Value:" + snapshot.data.toString(),
                    textScaleFactor: 2,
                  );
                } else {
                  return Text(
                    "Value:0 ".toString(),
                    textScaleFactor: 2,
                  );
                }
              }),
         
          ElevatedButton(
              onPressed: () {
                value++;
                streamObject.sink.add(value);
              },
              child: Text("Add")),
          ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => BroadCastStream()));
              },
              child: Text("Go to BroadCast Stream")),
        ],
      ),
    );
  }
}
