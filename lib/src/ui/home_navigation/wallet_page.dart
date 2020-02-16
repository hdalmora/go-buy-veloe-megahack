import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:next_toll_veloe/src/blocs/authentication/authentication_bloc.dart';
import 'package:next_toll_veloe/src/blocs/authentication/authentication_bloc_provider.dart';
import 'package:next_toll_veloe/src/blocs/user/user_bloc.dart';
import 'package:next_toll_veloe/src/blocs/user/user_bloc_provider.dart';
import 'package:next_toll_veloe/src/ui/widgets/custom_buttom.dart';
import 'package:next_toll_veloe/src/utils/values/color_constants.dart';

class WalletPage extends StatefulWidget {
  static const String routeName = 'wallet_page';

  const WalletPage({Key key}) : super(key: key);

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {

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
          child:

          FutureBuilder<String>(
            future: _userBloc.getUserUID(),
            builder: (context, snapshot) {
              if(!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
                return Align(
                  alignment: Alignment.topCenter,
                  child: LinearProgressIndicator(
                    backgroundColor: ColorConstants.colorMainBlue,
                  ),
                );
              } else {
                return StreamBuilder<QuerySnapshot>(
                  stream: _userBloc.purchasesList(snapshot.data),
                  builder: (context, snapshot) {
                    if(snapshot.hasData) {
                      List<DocumentSnapshot> docs = snapshot.data.documents;

                      if(docs.isNotEmpty) {
                        return Container(child: Text("ATIVIDADES RECENTES", style: TextStyle(fontSize: 50.0, color: Colors.white),),);
                      } else {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 30.0, left: 20.0),
                              child: Text(
                                  "Olá, Henrique",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28.0)
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 30.0, left: 20.0, bottom: 20.0, right: 20.0),
                              child: Text(
                                  "Você ainda não realizou uma compra...",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21.0)
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 20.0),
                              alignment: Alignment.center,
                              height: 150.0,
                              child: Image.asset("assets/images/sad.png", color: Colors.black26,),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 35.0, left: 20.0, bottom: 20.0, right: 20.0),
                              child: Text(
                                  "Para começar, faça o Check-in em uma loja ao escanear seu QR Code através do botão abaixo",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21.0)
                              ),
                            ),


//                                          CustomButtom(
//                                            callback: () async {
//                                              _userBloc.logOut();
//                                            },
//                                            height: 40.0,
//                                            width: MediaQuery.of(context).size.width,
//                                            fontSize: 16.0,
//                                            marginRight: 100.0,
//                                            marginLeft: 100.0,
//                                            marginTop: 15.0,
//                                            text: 'log Out',
//                                            textColor: Colors.white,
//                                          ),
                          ],
                        );
                      }
                    } else {
                      // No data yet
                      return Container();
                    }
                  }
                );
              }
            }
          ),
      ),
    );
  }
}
