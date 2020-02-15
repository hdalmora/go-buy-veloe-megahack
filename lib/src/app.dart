import 'package:flutter/material.dart';
import 'package:next_toll_veloe/src/root_page.dart';
import 'package:next_toll_veloe/src/ui/authentication/auth_page.dart';
import 'package:next_toll_veloe/src/ui/home/home_page.dart';
import 'blocs/authentication/authentication_bloc_provider.dart';

class NextToll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AuthenticationBlocProvider(
      child: MaterialApp(
        title: 'Next Toll',
        theme: ThemeData(
          accentColor: Colors.blueAccent,
          fontFamily: 'SF Pro Display',
        ),
        initialRoute: RootPage.routeName,
        routes: {
          RootPage.routeName: (context) => RootPage(),
          AuthPage.routeName: (context) => AuthPage(),
          HomePage.routeName: (context) => HomePage(),
        },
      ),
    );
  }

}