import 'package:flutter/material.dart';
import 'package:sampleapp/firebase_options.dart';
import 'package:sampleapp/routes.dart';

import 'package:firebase_core/firebase_core.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  final Future _initialization = Firebase.initializeApp(
    name: 'SampleApp',
    options: DefaultFirebaseOptions.currentPlatform,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(
              snapshot.error.toString(),
              textDirection: TextDirection.ltr,
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: appRoutes,
            initialRoute: '/',
          );
        }

        return const Center(
          child: Text(
            'loading',
            textDirection: TextDirection.ltr,
          ),
        );
      },
    );
  }
}
