import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:supermarket/view/feature/shopping/shopping.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Supermarket"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Adicione uma nova compra',
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _goToCaptureQrCode(context);
        },
        tooltip: 'Adicionar',
        child: Icon(Icons.add),
      ),
    );
  }

  _goToCaptureQrCode(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Shopping()));
  }
}
