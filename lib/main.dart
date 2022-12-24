import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simbo_1/model/client.dart';
import 'package:simbo_1/pages/signin.dart';
import 'package:simbo_1/pages/splash.screnn.dart';

import 'pages/dashboard.dart';

late Box box;
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter<Client>(ClientAdapter());
  box = await Hive.openBox<Client>('client');

  runApp(const MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        home: SignIn(),
      );
}
