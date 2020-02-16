import 'package:flutter/material.dart';
import 'package:next_toll_veloe/src/blocs/store/store_bloc.dart';

class StoreBlocProvider extends InheritedWidget{
  final bloc = StoreBloc();

  StoreBlocProvider({Key key, Widget child}) : super(key: key, child: child);

  bool updateShouldNotify(_) => true;

  static StoreBloc of(BuildContext context) {
    return (context.dependOnInheritedWidgetOfExactType<StoreBlocProvider>()).bloc;
  }
}