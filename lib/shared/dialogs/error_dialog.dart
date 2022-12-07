import 'package:flutter/material.dart';

class ErrorDialog extends StatelessWidget {
  const ErrorDialog({
    super.key,
    required this.message,
  });

  final String message;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Error', style: Theme.of(context).textTheme.bodyText1,),
      content: Text(message, style: Theme.of(context).textTheme.bodyText1,),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('OK', style: Theme.of(context).textTheme.bodyText1,),
        )
      ],
    );
  }
}

Future<void> showErrorDialog({required BuildContext context, required String message}) {
  return showDialog(
    context: context,
    builder: (context) => ErrorDialog(message: message),
  );
}
