import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/api/qrcode/qrcode_api_impl.dart';
import 'package:supermarket/bloc/qrcode/shopping_bloc.dart';
import 'package:supermarket/view/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ShoppingBloc>(
          create: (BuildContext context) => ShoppingBloc(QrCodeApiImpl()),
        ),
      ],
      child: MaterialApp(
        title: 'Supermarket',
        theme: ThemeData(
            primaryColor: Color.fromRGBO(5, 45, 131, 1),
            accentColor: Color.fromRGBO(131, 91, 5, 1),
            buttonTheme: ButtonThemeData(
                buttonColor: Colors.blueGrey,
                shape: RoundedRectangleBorder(),
                textTheme: ButtonTextTheme.primary)),
        home: Home(),
      ),
    );
  }
}
