
import 'package:flutter/material.dart';
import 'package:next_toll_veloe/src/ui/home_navigation/profile_page.dart';
import 'package:next_toll_veloe/src/ui/home_navigation/settings_page.dart';
import 'package:next_toll_veloe/src/ui/home_navigation/shopping_cart_page.dart';
import 'wallet_page.dart';

class NavPage extends StatefulWidget {
  static const String routeName = 'nav_page';

  @override
  _NavPageState createState() =>
      _NavPageState();
}

class _NavPageState
    extends State<NavPage> {
  final List<Widget> pages = [
    WalletPage(
      key: PageStorageKey('Page1'),
    ),
    ShoppingCartPage(
      key: PageStorageKey('Page2'),
    ),
    ProfilePage(
      key: PageStorageKey('Page3'),
    ),
    SettingsPage(
      key: PageStorageKey('Page4'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
    currentIndex: selectedIndex,
    showSelectedLabels: true,
    showUnselectedLabels: false,
    type: BottomNavigationBarType.fixed,
    items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet,color: Color.fromARGB(255, 0, 0, 0)),
          title: new Text('Carteira')
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.local_grocery_store,color: Color.fromARGB(255, 0, 0, 0)),
          title: new Text('Carrinho')
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.person,color: Color.fromARGB(255, 0, 0, 0)),
          title: new Text('Perfil')
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.settings,color: Color.fromARGB(255, 0, 0, 0)),
          title: new Text('Configurações')
      ),
    ],
    onTap: (index) {
      setState(() {
        _selectedIndex = index;
      });
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: _bottomNavigationBar(_selectedIndex),
      body: PageStorage(
        child: pages[_selectedIndex],
        bucket: bucket,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Container(
          height: 35.0,
          child: Image.asset("assets/images/scan.png", color: Colors.white,),
        ),
      ),
    );
  }
}