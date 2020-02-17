import 'package:flutter/material.dart';
import 'package:next_toll_veloe/src/blocs/user/user_bloc.dart';
import 'package:next_toll_veloe/src/blocs/user/user_bloc_provider.dart';
import 'package:next_toll_veloe/src/ui/widgets/custom_buttom.dart';

class ProfilePage extends StatefulWidget {
  static const String routeName = 'profile_page';

  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  UserBloc _userBloc;

  @override
  void didChangeDependencies() {
    _userBloc = UserBlocProvider.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(alignment: Alignment.center,
                child: CustomButtom(
                  callback: () async {
                    _userBloc.logOut();
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
            ),

          ],
        ),
      ),
    );
  }
}
