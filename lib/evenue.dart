import 'package:evenue/modules/events_list/events_widget.dart';
import 'package:flutter/material.dart';

class Evenue extends StatelessWidget {
  const Evenue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('hello'),),
        body: EventsWidget(),
      ),
    );
  }
}
