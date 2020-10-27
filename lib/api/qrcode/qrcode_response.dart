class QrCodeResponse {
  Shopping shopping;
  List<Products> products;

  QrCodeResponse({this.shopping, this.products});

  QrCodeResponse.fromJson(Map<String, dynamic> json) {
    shopping = json['shopping'] != null
        ? new Shopping.fromJson(json['shopping'])
        : null;
    if (json['products'] != null) {
      products = new List<Products>();
      json['products'].forEach((v) {
        products.add(new Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.shopping != null) {
      data['shopping'] = this.shopping.toJson();
    }
    if (this.products != null) {
      data['products'] = this.products.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Shopping {
  int id;
  String formatDate;
  int timestamp;
  double totalValue;
  String accessKey;
  Supermarket supermarket;

  Shopping(
      {this.id,
        this.formatDate,
        this.timestamp,
        this.totalValue,
        this.accessKey,
        this.supermarket});

  Shopping.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    formatDate = json['formatDate'];
    timestamp = json['timestamp'];
    totalValue = json['totalValue'];
    accessKey = json['accessKey'];
    supermarket = json['supermarket'] != null
        ? new Supermarket.fromJson(json['supermarket'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['formatDate'] = this.formatDate;
    data['timestamp'] = this.timestamp;
    data['totalValue'] = this.totalValue;
    data['accessKey'] = this.accessKey;
    if (this.supermarket != null) {
      data['supermarket'] = this.supermarket.toJson();
    }
    return data;
  }
}

class Supermarket {
  int id;
  String cnpj;
  String name;
  Address address;

  Supermarket({this.id, this.cnpj, this.name, this.address});

  Supermarket.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cnpj = json['cnpj'];
    name = json['name'];
    address =
    json['address'] != null ? new Address.fromJson(json['address']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['cnpj'] = this.cnpj;
    data['name'] = this.name;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    return data;
  }
}

class Address {
  int id;
  String address;
  String number;
  String neighborhood;
  String city;
  String state;
  Null cep;

  Address(
      {this.id,
        this.address,
        this.number,
        this.neighborhood,
        this.city,
        this.state,
        this.cep});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    address = json['address'];
    number = json['number'];
    neighborhood = json['neighborhood'];
    city = json['city'];
    state = json['state'];
    cep = json['cep'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['address'] = this.address;
    data['number'] = this.number;
    data['neighborhood'] = this.neighborhood;
    data['city'] = this.city;
    data['state'] = this.state;
    data['cep'] = this.cep;
    return data;
  }
}

class Products {
  int id;
  String name;
  String code;
  num amount;
  String type;
  double unitaryValue;
  double totalValue;

  Products(
      {this.id,
        this.name,
        this.code,
        this.amount,
        this.type,
        this.unitaryValue,
        this.totalValue});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    code = json['code'];
    amount = json['amount'];
    type = json['type'];
    unitaryValue = json['unitaryValue'];
    totalValue = json['totalValue'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['code'] = this.code;
    data['amount'] = this.amount;
    data['type'] = this.type;
    data['unitaryValue'] = this.unitaryValue;
    data['totalValue'] = this.totalValue;
    return data;
  }
}