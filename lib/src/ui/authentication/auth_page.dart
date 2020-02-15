import 'package:flutter/material.dart';
import 'package:next_toll_veloe/src/ui/widgets/custom_buttom.dart';
import 'package:next_toll_veloe/src/ui/widgets/custom_field_text.dart';
import 'package:next_toll_veloe/src/utils/values/color_constants.dart';

class AuthPage extends StatefulWidget {
  static const String routeName = 'login_page';

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  List<bool> _authOptSelected;

  @override
  void initState() {
    _authOptSelected = [true, false];

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        resizeToAvoidBottomPadding: false,
        body: Center(
          child: Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                    ColorConstants.colorMainBlue,
                    ColorConstants.colorBlueOcean
                  ])),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              'GO! BUY',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 50.0
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ToggleButtons(
                              borderColor: Colors.transparent,
                              borderWidth: 0.0,
                              borderRadius: BorderRadius.all(Radius.circular(13.0)),
                              selectedColor: ColorConstants.colorSecondaryBlue,
                              color: Colors.white,
//                              fillColor: Colors.white,
                              children: <Widget>[
                                Container(
                                  height: 60.0,
                                  width: 150.0,
                                  decoration: BoxDecoration(
                                      gradient: _authOptSelected[1] == true ?
                                      LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          colors: [
                                            ColorConstants.colorMainBlue,
                                            ColorConstants.colorBlueOcean
                                          ]) :
                                      LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Colors.white,
                                            Colors.white
                                          ])),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'ENTRAR',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),

                                Container(
                                  height: 60.0,
                                  width: 150.0,
                                  decoration: BoxDecoration(
//                                      color: _authOptSelected[1] == true ? Colors.white : ColorConstants.colorMainBlue,
                                      gradient: _authOptSelected[0] == true ?
                                      LinearGradient(
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                      colors: [
                                        ColorConstants.colorMainBlue,
                                        ColorConstants.colorBlueOcean
                                      ]) :
                                      LinearGradient(
                                          begin: Alignment.centerLeft,
                                          end: Alignment.centerRight,
                                          colors: [
                                            Colors.white,
                                            Colors.white
                                          ])
                                  ),
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      'CADASTRO',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ),
                                ),
                              ],
                              onPressed: (int index) {
                                setState(() {
                                  for (int i = 0; i < _authOptSelected.length; i++) {
                                    _authOptSelected[i] = i == index;
                                  }
                                });
                              },
                              isSelected: _authOptSelected,
                            ),
                          ],
                        ),
                      ),
                    ),

                    Flexible(
                      flex: 2,
                      child: AnimatedSwitcher(
                          duration: Duration(milliseconds: 300),
                          child: _authOptSelected[1] == true ?
                          Container(
                            key: ValueKey<int>(1),
                            child: Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  CustomFieldText(
                                    hintText: 'E-mail',
                                    prefixIcon: Icons.email,
                                    onChanged: (value){},
                                    //                                errorText: ,
                                    marginLeft: 35.0,
                                    marginRight: 35.0,
                                    marginTop: 0,
                                    textInputType: TextInputType.text,
                                    obscured: false,
                                  ),

                                  CustomFieldText(
                                    hintText: 'Senha',
                                    prefixIcon: Icons.lock,
                                    onChanged: (value){},
                                    //                                errorText: ,
                                    marginLeft: 35.0,
                                    marginRight: 35.0,
                                    marginTop: 10.0,
                                    textInputType: TextInputType.text,
                                    obscured: false,
                                  ),

                                  CustomFieldText(
                                    hintText: 'Confirmar senha ',
                                    prefixIcon: Icons.lock,
                                    onChanged: (value){},
                                    //                                errorText: ,
                                    marginLeft: 35.0,
                                    marginRight: 35.0,
                                    marginTop: 10.0,
                                    textInputType: TextInputType.text,
                                    obscured: false,
                                  ),
                                ],
                              ),
                            ),
                          ) :
                          Container(
                            key: ValueKey<int>(2),
                            child: Container(
                              margin: EdgeInsets.only(top: 25.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  CustomFieldText(
                                    hintText: 'E-mail',
                                    prefixIcon: Icons.email,
                                    onChanged: (value){},
//                                errorText: ,
                                    marginLeft: 35.0,
                                    marginRight: 35.0,
                                    marginTop: 0,
                                    textInputType: TextInputType.text,
                                    obscured: false,
                                  ),

                                  CustomFieldText(
                                    hintText: 'Senha',
                                    prefixIcon: Icons.lock,
                                    onChanged: (value){},
//                                errorText: ,
                                    marginLeft: 35.0,
                                    marginRight: 35.0,
                                    marginTop: 10.0,
                                    textInputType: TextInputType.text,
                                    obscured: false,
                                  ),
                                ],
                              ),
                            ),
                          )
                      ),
                    ),


                    Flexible(
                      flex: 1,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            CustomButtom(
                              callback: () async {
                              },
                              height: 60.0,
                              width: MediaQuery.of(context).size.width,
                              fontSize: 18.0,
                              marginRight: 55.0,
                              marginLeft: 55.0,
                              marginTop: 10.0,
                              text: 'IR',
                              textColor: Colors.white,
                            ),

                            CustomButtom(
                              callback: () async {
                              },
                              height: 60.0,
                              width: MediaQuery.of(context).size.width,
                              fontSize: 16.0,
                              marginRight: 55.0,
                              marginLeft: 55.0,
                              marginTop: 10.0,
                              iconImagePath: "assets/images/google-plus.png",
                              text: 'Entrar com o Google',
                              textColor: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
