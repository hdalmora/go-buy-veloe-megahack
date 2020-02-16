import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:next_toll_veloe/src/utils/values/color_constants.dart';

class StorePage extends StatefulWidget {
  static const String routeName = 'store_page';

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: Container(
        margin: EdgeInsets.only(top: 120.0),
        width: 75.0,
        child: FloatingActionButton(
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.shopping_cart,),
              SizedBox(width: 5.0,),
              Text("0",
                style: TextStyle(
                  fontSize: 18.0
                ),
              ),
            ],
          ),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),      ),
      ),
      body: Stack(
          children: <Widget>[
            Positioned(
              top: 35.0,
              left: 10.0,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back_ios, size: 40.0, color: Colors.black54,)
              ),
            ),

            Positioned(
              top: 100.0,
              left: 25.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        height: 110.0,
                        width: 110.0,
                        child: CircleAvatar(
                            radius: 20,
                            backgroundImage: CachedNetworkImageProvider('https://dypdvfcjkqkg2.cloudfront.net/original/3976002-8990.png')
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 10.0, left: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Top Games",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25.0,
                                  color: Colors.black38
                              ),
                            ),

                            SizedBox(height: 5.0,),
                            RatingBar(
                              initialRating: 3,
                              minRating: 0,
                              itemSize: 25.0,
                              ignoreGestures: true,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 3.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                              },
                            ),
                          ],
                        ),
                      )
                    ],
                  ),


                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: 15.0),
                        child: Text(
                          "Descrição da loja",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                              color: Colors.black54
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 5.0),
                        width: MediaQuery.of(context).size.width * .85,
                        child: Text(
                          "Somos a maior e melhor loja de games do mundo! Contamos com todos os produtos nacionais e internacionais. Se você é um gamer de carteirinha, aqui é o seu lugar!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                              color: Colors.black38
                          ),
                        ),
                      ),

                      Container(
                        margin: EdgeInsets.only(top: 25.0),
                        child: Text(
                          "Últimos produtos",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0,
                              color: Colors.black54
                          ),
                        ),
                      ),


                      // Product Cart - Horizontal
                      GestureDetector(
                        child: Stack(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(18.0),
                              margin: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
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
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Container(
                                    color: Colors.blue,
                                    height: 100.0,
                                    width: 80.0,
                                    child: Image(fit: BoxFit.fill, image: CachedNetworkImageProvider('https://i.imgur.com/eOtEAB7.jpg'))
                                  ),

                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(top: 5.0),
                                    width: 120.0,
                                    child: Text(
                                      "TOMB RAIDER",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                          color: Colors.black54
                                      ),
                                    ),
                                  ),

                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(top: 5.0, bottom: 15.0),
                                    width: 120.0,
                                    child: Text(
                                      "R\$ 120.00",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                          color: Colors.black38
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            Positioned(
                              bottom: 0,
                              left: 15,
                              child: Container(
                                width: 80.0,
                                decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                        colors: [
                                          ColorConstants.colorMainBlue,
                                          ColorConstants.colorBlueOcean
                                        ]),
                                    color: ColorConstants.colorMainBlue,
                                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(8.0), topRight: Radius.circular(8.0))
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Container(
                                      margin: EdgeInsets.only(top: 5.0),
                                      child: Icon(Icons.add, color: Colors.white,),
                                    ),

                                    Container(
                                      margin: EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        "ADD",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0,
                                            color: Colors.white
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
    );
  }
}
