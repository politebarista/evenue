import 'package:evenue/common/ui/indent_widget.dart';
import 'package:flutter/material.dart';

import 'event_widget.dart';

class EventsWidget extends StatelessWidget {
  const EventsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IndentWidget(
      child: Wrap(
        spacing: 10,
        runSpacing: 10,
        children: [
          EventWidget(),
          EventWidget(),
          EventWidget(),
        ],
      ),
    );
  }
}
