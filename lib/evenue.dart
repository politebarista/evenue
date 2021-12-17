import 'package:evenue/common/ui/custom_text_theme.dart';
import 'package:evenue/common/ui/custom_theme.dart';
import 'package:evenue/modules/events_list/events_widget.dart';
import 'package:flutter/material.dart';

class Evenue extends StatelessWidget {
  const Evenue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTextTheme = CustomTextTheme(context);
    final customTheme = CustomTheme(customTextTheme);

    return MaterialApp(
      theme: customTheme.themeData,
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text('Evenue'),
          ),
        ),
        body: EventsWidget(),
      ),
    );
  }
}
