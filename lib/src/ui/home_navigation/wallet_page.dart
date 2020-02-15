import 'package:flutter/material.dart';
import 'package:next_toll_veloe/src/blocs/authentication/authentication_bloc.dart';
import 'package:next_toll_veloe/src/blocs/authentication/authentication_bloc_provider.dart';
import 'package:next_toll_veloe/src/ui/widgets/custom_buttom.dart';
import 'package:next_toll_veloe/src/utils/values/color_constants.dart';

class WalletPage extends StatefulWidget {
  static const String routeName = 'wallet_page';

  const WalletPage({Key key}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {

  AuthenticationBloc _authBloc;

  @override
  void didChangeDependencies() {
    _authBloc = AuthenticationBlocProvider.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.colorMainBlue,
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text("Wallet Page", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0)),


              CustomButtom(
                callback: () async {
                  _authBloc.logOut();
                },
                height: 40.0,
                width: MediaQuery.of(context).size.width,
                fontSize: 16.0,
                marginRight: 100.0,
                marginLeft: 100.0,
                marginTop: 15.0,
                text: 'log Out',
                textColor: Colors.white,
              ),
            ],
          ),
      ),
    );
  }
}
