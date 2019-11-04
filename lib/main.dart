import 'package:flutter/material.dart';
import 'package:flutter_kyou_app/routes/routes.dart';
import 'package:provider/provider.dart';

import 'locator.dart';
import 'models/crud_model.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(builder: (_) => locator<CrudModel>()),
        ],
        child: MaterialApp(
            title: 'Market App',
            debugShowCheckedModeBanner: false,
            theme: new ThemeData(
                primarySwatch:  Colors.blue
            ),
            initialRoute: '/',
            onGenerateRoute: RouteGenerator.generateRoute
        )
    );
  }
}

