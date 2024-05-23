import 'package:evenue/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dialogs/flutter_dialogs.dart';

Future<T?> showEvenueDialog<T>({
  required BuildContext context,
  required String title,
  String? content,
  Iterable<EvenueDialogAction>? actions,
  bool canPop = true,
}) => showPlatformDialog<T>(
  context: context,
  builder: (_) => WillPopScope(
    onWillPop: () async => canPop,
    child: BasicDialogAlert(
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
        ),
      ),
      content: content != null ? Text(
        content,
        style: TextStyle(color: Colors.black),
      ) : null,
      actions: actions != null
        ? actions.map((e) => BasicDialogAction(
            title: Text(e.title),
            onPressed: e.onPressed,
          )).toList()
        : [
            BasicDialogAction(
              title: Text(S.current.evenueDialogDefaultButton),
              onPressed: () => Navigator.of(context, rootNavigator: true).pop(),
            ),
          ],
    ),
  ),
);

// ignore: prefer-match-file-name
class EvenueDialogAction {
  final String title;
  final void Function()? onPressed;

  EvenueDialogAction(this.title, this.onPressed);
}