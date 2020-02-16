import 'package:flutter/material.dart';
import 'package:next_toll_veloe/src/models/Item.dart';
import 'package:next_toll_veloe/src/utils/values/color_constants.dart';

class CheckoutPage extends StatefulWidget {
  static const String routeName = 'checkout_page';

  const CheckoutPage({Key key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final List<Item> items = ModalRoute.of(context).settings.arguments;
    print("ITEMS: $items");

    return Scaffold(
      backgroundColor: ColorConstants.colorMainBlue,
      resizeToAvoidBottomPadding: false,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Align(alignment: Alignment.center, child: Text("Shopping Cart Page", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20.0))),

          ],
        ),
      ),
    );
  }
}
