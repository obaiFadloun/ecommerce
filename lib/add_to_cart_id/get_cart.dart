import 'package:http/http.dart' as http;
import '../main.dart';
import '../service/http.dart';

class Api2 {
  static Future<http.Response> getCartOrder(
      String token,
      ) async {
    var url = Uri.parse(baseURL+'/get_cart_orders');
    http.Response response = await http.get(
      url,
      headers: headers(token),
    );
    print(response.body);
    return response;
  }

  static Map<String, String> headers(String token) {
    return {
      "Content-Type": "application/json",
      'Authorization': 'Bearer ${prefs.get("token")}',
      "Accept-Charset": "application/json",
      "Accept": "application/json",
    };
  }
}
class GetCartModel {
  bool status;
  List<Data> data;
  int code;

  GetCartModel({this.status , this.data, this.code});

  GetCartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class Data {
  int id;
  int count;
  int userId;
  int productId;
  String createdAt;
  String updatedAt;
  Products products;

  Data(
      {this.id,
        this.count,
        this.userId,
        this.productId,
        this.createdAt,
        this.updatedAt,
        this.products});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    count = json['count'];
    userId = json['user_id'];
    productId = json['product_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    products = json['products'] != null
        ? new Products.fromJson(json['products'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['count'] = this.count;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.products != null) {
      data['products'] = this.products.toJson();
    }
    return data;
  }
}

class Products {
  int id;
  String name;
  String title;
  String slug;
  int price;
  int unitPrice;
  String image;
  String availableFor;
  String publishingHouseId;
  String description;
  int outOfStock;
  int categoryId;
  String createdAt;
  String updatedAt;
  String image2;
  int priceAfterDiscount;
  String favourite;
  bool cart;
  String ratingSum;

  Products(
      {this.id,
        this.name,
        this.title,
        this.slug,
        this.price,
        this.image,
        this.unitPrice,
        this.availableFor,
        this.publishingHouseId,
        this.description,
        this.outOfStock,
        this.categoryId,
        this.createdAt,
        this.updatedAt,
        this.image2,
        this.priceAfterDiscount,
        this.favourite,
        this.cart,
        this.ratingSum});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    slug = json['slug'];
    price = json['price'];
    image = json['image'];
    availableFor = json['available_for'];
    publishingHouseId = json['publishing_house_id'];
    description = json['description'];
    outOfStock = json['out_of_stock'];
    categoryId = json['category_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    image2 = json['image2'];
    priceAfterDiscount = json['price_after_discount'];
    favourite = json['favourite'];
    cart = json['cart'];
    ratingSum = json['ratingSum'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['title'] = this.title;
    data['slug'] = this.slug;
    data['price'] = this.price;
    data['image'] = this.image;
    data['available_for'] = this.availableFor;
    data['publishing_house_id'] = this.publishingHouseId;
    data['description'] = this.description;
    data['out_of_stock'] = this.outOfStock;
    data['category_id'] = this.categoryId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['image2'] = this.image2;
    data['price_after_discount'] = this.priceAfterDiscount;
    data['favourite'] = this.favourite;
    data['cart'] = this.cart;
    data['ratingSum'] = this.ratingSum;
    return data;
  }
}
