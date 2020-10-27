import 'package:supermarket/domain/product.dart';
import 'package:supermarket/domain/supermarket.dart';

class Shopping {
  final int id;
  final DateTime dateTime;
  final double total;
  final Supermarket supermarket;
  final List<Product> products;

  Shopping(
      {this.id, this.dateTime, this.total, this.supermarket, this.products});

  addProduct(Product prodcut) {
    products.add(prodcut);
  }
}
