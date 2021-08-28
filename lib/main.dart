import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

import './screens/auth_screen.dart';
import './providers/auth.dart';
import 'screens/karma_screen.dart';
import './screens/profile_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarIconBrightness: Brightness.dark,
    statusBarColor: Color.fromRGBO(255, 132, 0, 1), // status bar color
  ));
  SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);
  return runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Auth()),
      ],
      child: Consumer<Auth>(
        builder: (context, auth, ch) {
          return MaterialApp(
            title: 'karma',
            theme: ThemeData(
                primaryColor: Color.fromRGBO(255, 132, 0, 1),
                primaryColorDark: Color.fromRGBO(228, 119, 0, 1),
                primaryColorLight: Color.fromRGBO(255, 159, 49, 1),
                accentColor: Color.fromRGBO(83, 228, 13, 1),
                textTheme: TextTheme()),
            home: auth.isAuth ? KarmaDriveScreen() : AuthScreen(),
            routes: {
              AuthScreen.routeName: (context) => AuthScreen(),
              KarmaDriveScreen.routeName: (context) => KarmaDriveScreen(),
              ProfileScreen.routeName: (context) => ProfileScreen(),
            },
          );
        },
      ),
    );
  }
}
