import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Navigation Extension Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                context.showMyDialog(
                  child: AlertDialog(
                    title: Text('Custom Dialog'),
                    content:
                        Text('This is a custom dialog using the extension.'),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(),
                        child: Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              child: Text('Show Dialog'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                context.showSucessSnackBar(
                  Text('Operation successful!'),
                  duration: Duration(seconds: 2),
                );
              },
              child: Text('Show Success SnackBar'),
            ),
          ],
        ),
      ),
    );
  }
}

extension NavigationExtension on BuildContext {
  Future showMyDialog({required Widget child, bool isDismissible = true}) {
    return showDialog(
      context: this,
      builder: (context) => child,
      barrierDismissible: isDismissible,
    );
  }

  void showSucessSnackBar(Widget child,
      {bool? isDismissible, Duration? duration}) {
    ScaffoldMessenger.of(this)
      ..clearSnackBars()
      ..showSnackBar(
        SnackBar(
          content: child,
          backgroundColor: Colors.green,
          dismissDirection: (isDismissible ?? true)
              ? DismissDirection.down
              : DismissDirection.none,
          duration: duration ?? const Duration(seconds: 4),
        ),
      );
  }
}
