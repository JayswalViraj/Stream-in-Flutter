import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stream_in_flutter/broad_cast_stream.dart';

class SingleStream extends StatefulWidget {
  const SingleStream({super.key});

  @override
  State<SingleStream> createState() => _SingleStreamState();
}

class _SingleStreamState extends State<SingleStream> {
  int value = 0;

  StreamController<int> streamObject = StreamController<int>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          StreamBuilder(
              stream: streamObject.stream,
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
