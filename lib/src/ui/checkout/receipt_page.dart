import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:next_toll_veloe/src/models/arguments/CheckoutArguments.dart';
import 'package:next_toll_veloe/src/ui/widgets/custom_buttom.dart';
import 'package:next_toll_veloe/src/utils/values/color_constants.dart';

class ReceiptPage extends StatefulWidget {
  static const String routeName = 'receipt_page';

  @override
  _ReceiptPageState createState() => _ReceiptPageState();
}

class _ReceiptPageState extends State<ReceiptPage> {
  @override
  Widget build(BuildContext context) {

    CheckoutArguments arguments = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      backgroundColor: ColorConstants.colorMainBlue,
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[

          Positioned(
            top: 45,
            left: 15,
            child: Container(
              padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 15, bottom: 15),
              width: MediaQuery.of(context).size.width*.9,
              height: MediaQuery.of(context).size.height*.75,
              margin: const EdgeInsets.only(left: 0.0, right: 0.0, top: 20.0),
              decoration: const BoxDecoration(
                color: ColorConstants.colorWhiteFA,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5.0, // soften the shadow
                    spreadRadius: 2.0, //extend the shadow
                  )
                ],
                borderRadius: BorderRadius.vertical(
                    top: Radius.circular(8), bottom: Radius.circular(8)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width*.9,
                    margin: EdgeInsets.only(top: 2.0, left: 10),
                    child: Text(
                      "Você realizou uma compra!",
                      style: TextStyle(
                          fontSize: 29.0,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.colorSecondaryBlue
                      ),
                    ),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 20.0, right: 25.0),
                    alignment: Alignment.center,
                    height: 100.0,
                    child: Image.asset("assets/images/lead.png", color: ColorConstants.colorSecondaryBlue,),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width*.9,
                    margin: EdgeInsets.only(top: 15.0, left: 10),
                    child: Text(
                      "Siga para o caixa da loja e mostre sua nota para um atendente",
                      style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                          color: ColorConstants.colorSecondaryBlue
                      ),
                    ),
                  ),


                  Container(
                    width: MediaQuery.of(context).size.width*.8,
                    height: 180.0,
                    margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 20.0),
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: arguments.items.length,
                      itemBuilder: (context, position) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              width: 25,
                              margin: EdgeInsets.only(top: 15.0, left: 10),
                              child: Text(
                                "1x.",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: ColorConstants.colorSecondaryBlue
                                ),
                              ),
                            ),

                            Container(
                              width: 120,
                              margin: EdgeInsets.only(top: 15.0, left: 10),
                              child: Text(
                                arguments.items[position].itemName,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: ColorConstants.colorSecondaryBlue
                                ),
                              ),
                            ),

                            Container(
                              width: 70,
                              margin: EdgeInsets.only(top: 15.0, left: 10),
                              child: Text(
                                "R\$ ${arguments.items[position].itemPrice}",
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontWeight: FontWeight.bold,
                                    color: ColorConstants.colorSecondaryBlue
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),



                ],
              ),
            ),
          ),

          Positioned.fill(
            bottom: 25,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: CustomButtom(
                callback: () async {
                  Navigator.of(context).pop();
                },
                height: 40.0,
                width: MediaQuery.of(context).size.width*.7,
                fontSize: 16.0,
                marginRight: 0.0,
                marginLeft: 0.0,
                marginTop: 25.0,
                text: 'Entendi!',
                textColor: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
