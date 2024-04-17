import 'package:evenue/common/ui/custom_text_theme.dart';
import 'package:evenue/common/ui/custom_theme.dart';
import 'package:evenue/features/city_choice/city_choice_screen.dart';
import 'package:evenue/features/navigation_controller/navigation_controller_widget.dart';
import 'package:evenue/generated/l10n.dart';
import 'package:evenue/stores/user_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Evenue extends StatelessWidget {
  const Evenue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final customTextTheme = CustomTextTheme(context);
    final customTheme = CustomTheme(customTextTheme);

    return MaterialApp(
      theme: customTheme.themeData,
      localizationsDelegates: [S.delegate],
      supportedLocales: S.delegate.supportedLocales,
      home: context.read<UserStore>().selectedCityId != null
          ? NavigationControllerWidget()
          : CityChoiceScreen(),
    );
  }
}