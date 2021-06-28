import 'package:app_with_api/generated/l10n.dart';
import 'package:flutter/material.dart';

class ConnectionErrorScreen extends StatelessWidget {
  const ConnectionErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            Text(S.current.connection_error),
            ElevatedButton(
              onPressed: () {
                print('add action');
              },
              child: Text(S.current.refresh_button),
            ),
          ],
        ),
      ),
    );
  }
}
