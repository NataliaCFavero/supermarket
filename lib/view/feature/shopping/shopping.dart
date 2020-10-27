import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supermarket/bloc/qrcode/shopping_bloc.dart';
import 'package:supermarket/bloc/qrcode/shopping_events.dart';
import 'package:supermarket/bloc/qrcode/shopping_states.dart';
import 'package:supermarket/domain/shopping.dart' as domain;
import 'package:supermarket/view/commons/loading.dart';

class Shopping extends StatelessWidget {
  List<Widget> listWidget = [];

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ShoppingBloc>(context).add(ShoppingReadQrCodeEvent());
    return Scaffold(
      appBar: AppBar(
        title: Text("Shopping"),
      ),
      body: BlocBuilder<ShoppingBloc, ShoppingStates>(
          bloc: BlocProvider.of<ShoppingBloc>(context),
          builder: (_, ShoppingStates state) {
            if (state is ShoppingInitState) {
              return Loading();
            } else if (state is ShoppingReadingQrCode) {
              return Loading();
            } else if (state is ShoppingSuccessQrCode) {
              return _body(state.shopping);
            } else {
              return Container();
            }
          }),
    );
  }

  _body(domain.Shopping shopping) {
    listProducts(shopping);
    return Container(
      color: Colors.black12,
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: listWidget,
      ),
    );
  }

  List<Widget> listProducts(domain.Shopping shopping) {
    shopping.products.forEach((element) {
      listWidget.add(_CardShopping(
        name: element.name,
        qtt: element.amount,
        total: element.total,
        price: element.unitary,
      ));
    });
  }
}

class _CardShopping extends StatelessWidget {
  final String name;
  final double qtt;
  final double total;
  final double price;
  final bool isActive;

  _CardShopping(
      {this.name, this.qtt, this.total, this.price, this.isActive = true})
      : assert(name != null),
        assert(qtt != null),
        assert(total != null),
        assert(price != null);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: isActive ? 3.0 : 0,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.horizontal(left: Radius.circular(5)),
                  color: isActive
                      ? Theme.of(context).primaryColor
                      : Theme.of(context).primaryColor.withOpacity(0.5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                      const SizedBox(height: 32),
                      Row(
                        children: <Widget>[
                          Text(
                            "R\$ ${price.toString()}",
                            style: TextStyle(color: Colors.white),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Qtde ${qtt.toString()}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "R\$ ${total.toString()}",
                      style: TextStyle(fontSize: 20.0),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    CircleAvatar(
                      radius: 16,
                      backgroundColor: Colors.black12,
                      child: IconButton(
                        icon: Icon(
                          isActive ? Icons.delete_forever : Icons.reply,
                          color: Colors.black,
                          size: 16,
                        ),
                        onPressed: () {
                          print("Test");
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
