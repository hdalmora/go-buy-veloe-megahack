import 'package:flutter/material.dart';
import 'package:next_toll_veloe/src/blocs/user/user_bloc.dart';

class UserBlocProvider extends InheritedWidget{
  final bloc = UserBloc();

  UserBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static UserBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<UserBlocProvider>()).bloc;
  }
}