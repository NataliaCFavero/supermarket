import 'package:supermarket/api/qrcode/qrcode_response.dart';
import 'package:supermarket/domain/product.dart';
import 'package:supermarket/domain/shopping.dart' as shoppingDomain;
import 'package:supermarket/domain/supermarket.dart' as supermarketDomain;

class ShoppingMapper {
  static shoppingDomain.Shopping map(QrCodeResponse response) {
    List<Product> products = [];

    final supermarket = supermarketDomain.Supermarket(
        id: response.shopping.supermarket.id,
        cnpj: response.shopping.supermarket.cnpj,
        name: response.shopping.supermarket.name);

    response.products.forEach((element) {
      products.add(Product(
          id: element.id,
          name: element.name,
          amount: element.amount,
          total: element.totalValue,
          unitary: element.unitaryValue));
    });

    return shoppingDomain.Shopping(
        id: response.shopping.id,
        total: response.shopping.totalValue,
        supermarket: supermarket,
        products: products);
  }
}
