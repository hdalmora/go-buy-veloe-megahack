import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:next_toll_veloe/src/blocs/store/store_bloc.dart';
import 'package:next_toll_veloe/src/blocs/store/store_bloc_provider.dart';
import 'package:next_toll_veloe/src/models/Item.dart';
import 'package:next_toll_veloe/src/models/arguments/CheckoutArguments.dart';
import 'package:next_toll_veloe/src/ui/checkout/checkout_page.dart';
import 'package:next_toll_veloe/src/utils/values/color_constants.dart';

class StorePage extends StatefulWidget {
  static const String routeName = 'store_page';

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  StoreBloc _storeBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _storeBloc = StoreBlocProvider.of(context);
    _storeBloc.clearItems();
    super.didChangeDependencies();
  }

  void showErrorMessage(String message) {
    final snackbar = SnackBar(content: Text(message), duration: new Duration(seconds: 2));
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {

    final String storeUID = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: false,
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: StreamBuilder(
        stream: _storeBloc.totalItems,
        builder: (context, snapshot) {
          return Container(
            margin: EdgeInsets.only(top: 120.0),
            width: 75.0,
            child: FloatingActionButton(
              onPressed: () {
                if(_storeBloc.isShoppingCartEmpty()) {
                  showErrorMessage("O carrinho está vazio");
                } else {
                  CheckoutArguments arguments = CheckoutArguments(1000.00, "debit", _storeBloc.getItemsAddedToCart(), storeUID, "logo", "name");
                  Navigator.of(context).pushReplacementNamed(CheckoutPage.routeName, arguments: arguments);
                }
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(Icons.shopping_cart,),
                  SizedBox(width: 5.0,),
                  Text(snapshot.data != null ? snapshot.data.toString() :  "0",
                    style: TextStyle(
                        fontSize: 18.0
                    ),
                  ),
                ],
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(16.0))),      ),
          );
        }
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

            FutureBuilder<DocumentSnapshot>(
              future: _storeBloc.storeDocument(storeUID),
              builder: (context, snapshot) {
                if(!snapshot.hasData || snapshot.connectionState == ConnectionState.waiting) {
                  return Container(
                    margin: EdgeInsets.only(top: 150),
                    child: CircularProgressIndicator(
                      backgroundColor: ColorConstants.colorMainBlue,
                    ),
                  );
                } else {
                  if(snapshot.hasData && snapshot.data.exists) {
                    DocumentSnapshot storeDoc = snapshot.data;

                    return Positioned(
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
                                    backgroundImage: CachedNetworkImageProvider(storeDoc.data['storeLogoUrl'])
                                ),
                              ),

                              Container(
                                margin: EdgeInsets.only(top: 10.0, left: 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      storeDoc.data['storeName'],
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25.0,
                                          color: Colors.black38
                                      ),
                                    ),

                                    SizedBox(height: 5.0,),
                                    RatingBar(
                                      initialRating: storeDoc.data['rating'],
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
                                  storeDoc.data['storeDescription'],
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


                              StreamBuilder<QuerySnapshot>(
                                stream: _storeBloc.sotoreProducts(storeUID),
                                builder: (context, snapshot) {
                                  if(snapshot.hasData) {

                                    List<DocumentSnapshot> docs = snapshot.data.documents;
                                    List<Item> items = List<Item>();

                                    docs.forEach((doc) {
                                      items.add(Item.fromDocument(doc));
                                    });

                                    if(items.isNotEmpty) {
                                      return Container(
                                        width: MediaQuery.of(context).size.width*.85,
                                        height: 220.0,
                                        child: ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: items.length,
                                          itemBuilder: (context, position) {
                                            return ProductCard(
                                              productName: items[position].itemName,
                                              productValue: "R\$ ${items[position].itemPrice}",
                                              callback: () {
                                                _storeBloc.addOrRemoveItemToCart(items[position]);
                                              },
                                              imageUrl: items[position].itemImageUrl,
                                            );
                                          },
                                        ),
                                      );
                                    } else {
                                      return Center(child: Text("No products to show"));
                                    }

                                  } else {
                                    return Container();
                                  }
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  } else {
                    Navigator.of(context).pop();
                    return Container();
                  }
                }
              }
            ),
          ],
        ),
    );
  }
}

class ProductCard extends StatefulWidget {
  final String imageUrl;
  final String productName;
  final String productValue;
  final VoidCallback callback;

  ProductCard({
    Key key,
    @required this.imageUrl,
    @required this.productName,
    @required this.productValue,
    @required this.callback,
  });

  @override
  _ProductCardState createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isSelected = !_isSelected;
        });

        widget.callback();
      },
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
                    child: Image(fit: BoxFit.fill, image: CachedNetworkImageProvider(widget.imageUrl))
                ),

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 5.0),
                  width: 120.0,
                  child: Text(
                    widget.productName,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14.0,
                        color: Colors.black54
                    ),
                  ),
                ),

                Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(top: 5.0, bottom: 25.0),
                  width: 120.0,
                  child: Text(
                    widget.productValue,
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
              width: _isSelected == false ? 80.0 : 120,
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
                    child: Icon(_isSelected == false ? Icons.add : Icons.remove, color: Colors.white,),
                  ),

                  Container(
                    margin: EdgeInsets.only(top: 5.0),
                    child: Text(
                      _isSelected == false ? "ADD" : "REMOVE",
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
    );
  }
}
