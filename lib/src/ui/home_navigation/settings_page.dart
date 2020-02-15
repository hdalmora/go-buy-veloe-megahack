import 'package:flutter/material.dart';
import 'package:next_toll_veloe/src/blocs/authentication/authentication_bloc.dart';
import 'package:next_toll_veloe/src/blocs/authentication/authentication_bloc_provider.dart';
import 'package:next_toll_veloe/src/utils/values/color_constants.dart';

class SettingsPage extends StatefulWidget {
  static const String routeName = 'settings_page';

  const SettingsPage({Key key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

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
            Align(alignment: Alignment.center, child: Text("Settings Page", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0))),

          ],
        ),
      ),
    );
  }
}
