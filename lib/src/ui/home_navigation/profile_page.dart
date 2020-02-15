import 'package:flutter/material.dart';
import 'package:next_toll_veloe/src/blocs/authentication/authentication_bloc.dart';
import 'package:next_toll_veloe/src/blocs/authentication/authentication_bloc_provider.dart';
import 'package:next_toll_veloe/src/utils/values/color_constants.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = 'profile_page';

  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

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
            Align(alignment: Alignment.center, child: Text("Profile Page", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0))),

          ],
        ),
      ),
    );
  }
}