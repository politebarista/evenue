import 'package:evenue/models/event.dart';
import 'package:flutter/material.dart';

class EventWidget extends StatelessWidget {
  final Event event;

  const EventWidget({required this.event, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      width: 150,
      height: 150,
      child: Column(
        children: [
          Text(event.name),
          Text(event.description),
        ],
      ),
    );
  }
}
