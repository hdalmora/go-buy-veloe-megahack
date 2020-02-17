import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:next_toll_veloe/src/blocs/user/user_bloc.dart';
import 'package:next_toll_veloe/src/blocs/user/user_bloc_provider.dart';
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
      backgroundColor: ColorConstants.colorMainBlue,
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
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 30.0, left: 20.0),
                              child: Text(
                                  "Olá !",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28.0)
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 30.0, left: 20.0),
                              child: Text(
                                  "Histórico de compras",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 25.0)
                              ),

                            ),

                            Container(
                              width: MediaQuery.of(context).size.width*.95,
                              height: MediaQuery.of(context).size.height*.45,
                              margin: EdgeInsets.only(top: 0.0, left: 10),
                              child: ListView.builder(
                                scrollDirection: Axis.vertical,
                                itemCount: docs.length,
                                itemBuilder: (context, position) {
                                  String name = docs[position]['storeName'];
                                  double price = docs[position]['totalValue'];
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Container(
                                        width: MediaQuery.of(context).size.width*.9,
                                        child: Divider(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 0, bottom: 10),
                                        child: Row(
                                          children: <Widget>[
                                            Container(
                                              margin: EdgeInsets.only(top: 10.0, left: 20.0),
                                              child: Text(
                                                  name.toUpperCase(),
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 18.0)
                                              ),
                                            ),

                                            Container(
                                              margin: EdgeInsets.only(top: 10.0, left: 20.0),
                                              child: Text(
                                                  "R\$ ${price.toStringAsFixed(2).toString()}",
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 18.0)
                                              ),
                                            ),
                                          ],
                                        ),

                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          ],
                        );
                      } else {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(top: 30.0, left: 20.0),
                              child: Text(
                                  "Olá !",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 28.0)
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 30.0, left: 20.0, bottom: 20.0, right: 20.0),
                              child: Text(
                                  "Você ainda não realizou uma compra...",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21.0)
                              ),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 20.0),
                              alignment: Alignment.center,
                              height: 150.0,
                              child: Image.asset("assets/images/sadface.png", color: Colors.white,),
                            ),

                            Container(
                              margin: EdgeInsets.only(top: 35.0, left: 20.0, bottom: 20.0, right: 20.0),
                              child: Text(
                                  "Para começar, faça o Check-in em uma loja ao escanear seu QR Code através do botão abaixo",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 21.0)
                              ),
                            ),
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
