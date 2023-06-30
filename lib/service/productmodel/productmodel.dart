import 'package:flutter/cupertino.dart';

class ProductModel {
  bool status;
  Data data;
  int code;
  ProductModel({this.status, this.data, this.code});
  ProductModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    code = json['code'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['code'] = this.code;
    return data;
  }
}

class Data {
  int currentPage;
  List<InsideData> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Links> links;
  Null nextPageUrl;
  String path;
  int perPage;
  Null prevPageUrl;
  int to;
  int total;

  Data(
      {this.currentPage,
        this.data,
        this.firstPageUrl,
        this.from,
        this.lastPage,
        this.lastPageUrl,
        this.links,
        this.nextPageUrl,
        this.path,
        this.perPage,
        this.prevPageUrl,
        this.to,
        this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <InsideData>[];
      json['data'].forEach((v) {
        data.add(new InsideData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    if (json['links'] != null) {
      links = <Links>[];
      json['links'].forEach((v) {
        links.add(new Links.fromJson(v));
      });
    }
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links.map((v) => v.toJson()).toList();
    }
    data['next_page_url'] = this.nextPageUrl;
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['prev_page_url'] = this.prevPageUrl;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class InsideData {
  int id;
  String name;
  String title;
  String authorName;
  int numberOfPages;
  String coverType;
  String slug;
  int price;
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

  InsideData(
      {this.id,
        this.name,
        this.title,
        this.authorName,
        this.numberOfPages,
        this.coverType,
        this.slug,
        this.price,
        this.image,
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

  InsideData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    title = json['title'];
    authorName = json['author_name'];
    numberOfPages = json['number_of_pages'];
    coverType = json['cover_type'];
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
    data['author_name'] = this.authorName;
    data['number_of_pages'] = this.numberOfPages;
    data['cover_type'] = this.coverType;
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

class Links {
  String url;
  String label;
  bool active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
