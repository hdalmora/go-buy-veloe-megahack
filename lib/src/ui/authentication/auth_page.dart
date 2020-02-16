import 'package:flutter/material.dart';
import 'package:next_toll_veloe/src/blocs/authentication/authentication_bloc.dart';
import 'package:next_toll_veloe/src/blocs/authentication/authentication_bloc_provider.dart';
import 'package:next_toll_veloe/src/ui/widgets/custom_buttom.dart';
import 'package:next_toll_veloe/src/ui/widgets/custom_field_text.dart';
import 'package:next_toll_veloe/src/utils/values/color_constants.dart';
import 'package:next_toll_veloe/src/utils/values/string_constants.dart';

class AuthPage extends StatefulWidget {
  static const String routeName = 'login_page';

  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  AuthenticationBloc _authBloc;

  List<bool> _authOptSelected;

  @override
  void didChangeDependencies() {
    _authBloc = AuthenticationBlocProvider.of(context);

    super.didChangeDependencies();
  }

  @override
  void initState() {
    _authOptSelected = [true, false];

    super.initState();
  }

  void showErrorMessage(String message) {
    final snackbar = SnackBar(content: Text(message), duration: new Duration(seconds: 2));
    _scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
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
                      flex: 2,
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  'G',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50.0
                                  ),
                                ),
                                Container(
                                  child: Image.asset("assets/images/arrowlogo.png"),
                                ),
                                Text(
                                  '! BUY',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 50.0
                                  ),
                                ),
                              ],
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
                                  height: 50.0,
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
                                  height: 50.0,
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
                                  if(_authOptSelected[index] != true) {
                                    _authBloc.resetFields();
                                  }

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
                      flex: 6,
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

                                  StreamBuilder(
                                      stream: _authBloc.email,
                                      builder: (context, snapshot) {
                                        return CustomFieldText(
                                          hintText: 'E-mail',
                                          prefixIcon: Icons.email,
                                          onChanged: _authBloc.changeEmail,
                                          errorText: snapshot.error,
                                          marginLeft: 35.0,
                                          marginRight: 35.0,
                                          marginTop: 0,
                                          textInputType: TextInputType.text,
                                          obscured: false,
                                        );
                                      }
                                  ),

                                  StreamBuilder(
                                      stream: _authBloc.password,
                                      builder: (context, snapshot) {
                                        return CustomFieldText(
                                          hintText: 'Senha',
                                          prefixIcon: Icons.lock,
                                          onChanged: _authBloc.changePassword,
                                          errorText: snapshot.error,
                                          marginLeft: 35.0,
                                          marginRight: 35.0,
                                          marginTop: 10.0,
                                          textInputType: TextInputType.text,
                                          obscured: true,
                                        );
                                      }
                                  ),

                                  StreamBuilder(
                                      stream: _authBloc.passwordConfirmation,
                                      builder: (context, snapshot) {
                                        return CustomFieldText(
                                          hintText: 'Confirmar senha ',
                                          prefixIcon: Icons.lock,
                                          onChanged: _authBloc.changePasswordConfirmation,
                                          errorText: snapshot.error,
                                          marginLeft: 35.0,
                                          marginRight: 35.0,
                                          marginTop: 10.0,
                                          textInputType: TextInputType.text,
                                          obscured: true,
                                        );
                                      }
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

                                  StreamBuilder(
                                      stream: _authBloc.email,
                                      builder: (context, snapshot) {
                                        return CustomFieldText(
                                          hintText: 'E-mail',
                                          prefixIcon: Icons.email,
                                          onChanged: _authBloc.changeEmail,
                                          errorText: snapshot.error,
                                          marginLeft: 35.0,
                                          marginRight: 35.0,
                                          marginTop: 0,
                                          textInputType: TextInputType.text,
                                          obscured: false,
                                        );
                                      }
                                  ),


                                  StreamBuilder(
                                    stream: _authBloc.password,
                                    builder: (context, snapshot) {
                                      return CustomFieldText(
                                        hintText: 'Senha',
                                        prefixIcon: Icons.lock,
                                        onChanged: _authBloc.changePassword,
                                        errorText: snapshot.error,
                                        marginLeft: 35.0,
                                        marginRight: 35.0,
                                        marginTop: 10.0,
                                        textInputType: TextInputType.text,
                                        obscured: true,
                                      );
                                    }
                                  ),
                                ],
                              ),
                            ),
                          )
                      ),
                    ),


                    Flexible(
                      flex: 3,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: StreamBuilder(
                            stream: _authBloc.signInStatus,
                            builder: (context, snapshot) {
                              if(!snapshot.hasData || snapshot.hasError || !snapshot.data) {
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    CustomButtom(
                                      callback: () async {
                                        int response;

                                        if(_authOptSelected[0] == true) { // login

                                          if(_authBloc.canLogin()) {
                                            response = await _authBloc.loginUser();
                                          } else {
                                            // show login form error message
                                            showErrorMessage(StringConstants.fillUpFormCorrectly);
                                          }
                                        } else { // register

                                          if(_authBloc.canRegister()) {
                                            response = await _authBloc.registerUser();
                                          } else {
                                            // show register form error message
                                            if(_authBloc.validateIfPasswordMatch()) {
                                              showErrorMessage(StringConstants.fillUpFormCorrectly);
                                            } else {
                                              showErrorMessage(StringConstants.passwordsDontMatch);
                                            }
                                          }
                                        }

                                        if(response != null) {
                                          if(response < 0 && _authOptSelected[0] == false) {
                                            // show email or password incorrect
                                            showErrorMessage(StringConstants.emailOrPasswordIncorrect);
                                          } else if(response < 0 && _authOptSelected[0] == true) {
                                            // show failed to login message
                                            showErrorMessage(StringConstants.failedToLogin);
                                          }
                                        }
                                      },
                                      height: 50.0,
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
                                        _authBloc.authWithGoogle();
                                      },
                                      height: 50.0,
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
                                );
                              } else {
                                return CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                );
                              }
                            }
                          ),
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
