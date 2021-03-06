
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:next_toll_veloe/src/blocs/user/user_bloc.dart';
import 'package:next_toll_veloe/src/blocs/user/user_bloc_provider.dart';
import 'package:next_toll_veloe/src/ui/home_navigation/profile_page.dart';
import 'package:next_toll_veloe/src/ui/store/store_page.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:next_toll_veloe/src/utils/values/color_constants.dart';
import 'wallet_page.dart';
import 'package:permission_handler/permission_handler.dart';

class NavPage extends StatefulWidget {
  static const String routeName = 'nav_page';

  @override
  _NavPageState createState() =>
      _NavPageState();
}

class _NavPageState extends State<NavPage> {
  UserBloc _userBloc;

  @override
  void didChangeDependencies() {
    _userBloc = UserBlocProvider.of(context);
    super.didChangeDependencies();
  }

  String _barCode = "";

  final List<Widget> pages = [
    WalletPage(
      key: PageStorageKey('Page1'),
    ),
    ProfilePage(
      key: PageStorageKey('Page2'),
    ),
  ];

  final PageStorageBucket bucket = PageStorageBucket();

  int _selectedIndex = 0;

  Widget _bottomNavigationBar(int selectedIndex) => BottomNavigationBar(
    currentIndex: selectedIndex,
    showSelectedLabels: true,
    showUnselectedLabels: false,
    selectedItemColor: ColorConstants.colorSecondaryBlue,
    type: BottomNavigationBarType.fixed,
    items: [
      BottomNavigationBarItem(
          icon: Icon(Icons.account_balance_wallet,color: Color.fromARGB(255, 0, 0, 0)),
          activeIcon: Icon(Icons.account_balance_wallet,color: ColorConstants.colorSecondaryBlue),
          title: new Text('Carteira')
      ),
      BottomNavigationBarItem(
          icon: Icon(Icons.person,color: Color.fromARGB(255, 0, 0, 0)),
          activeIcon: Icon(Icons.person,color: ColorConstants.colorSecondaryBlue),
          title: new Text('Perfil')
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
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 0.0),
        height: 70.0,
        width: 70.0,
        child: FittedBox(
          child: FloatingActionButton(
            onPressed: () async {

              final PermissionHandler _permissionHandler = PermissionHandler();
              var result = await _permissionHandler.requestPermissions([PermissionGroup.camera]);

              if (result[PermissionGroup.camera] == PermissionStatus.granted) {
                // permission was granted
                try {
                  String barcode = await BarcodeScanner.scan();
                  setState(() => this._barCode = barcode);
                } on PlatformException catch (e) {
                  if (e.code == BarcodeScanner.CameraAccessDenied) {
                    setState(() {
                      this._barCode = 'The user did not grant the camera permission!';
                    });
                  } else {
                    setState(() => this._barCode = 'Unknown error: $e');
                  }
                } on FormatException {
                  setState(() => this._barCode = 'null (User returned using the "back"-button before scanning anything. Result)');
                } catch (e) {
                  setState(() => this._barCode = 'Unknown error: $e');
                }

                print("CAMERA RESULT: $_barCode");

                DocumentSnapshot storeDoc = await _userBloc.checkInStore(_barCode);

                if(storeDoc.exists && storeDoc.documentID == _barCode) {
                  Navigator.of(context).pushNamed(StorePage.routeName, arguments: _barCode);
                }

              }
            },
            elevation: 12.0,
            backgroundColor: ColorConstants.colorSecondaryBlue,
            tooltip: 'Increment',
            child: Container(
              height: 28.0,
              child: Image.asset("assets/images/scan.png", color: Colors.white,),
            ),
          ),
        ),
      ),
    );
  }
}