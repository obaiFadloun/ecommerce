class FilterProducts {
  bool status;
  Data data;
  int code;
  FilterProducts({this.status, this.data, this.code});

  FilterProducts.fromJson(Map<String, dynamic> json) {
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
  List<InsideDataLocal> data;
  String firstPageUrl;
  int from;
  int lastPage;
  String lastPageUrl;
  List<Links> links;
  String path;
  int perPage;
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
        this.path,
        this.perPage,
        this.to,
        this.total});

  Data.fromJson(Map<String, dynamic> json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = <InsideDataLocal>[];
      json['data'].forEach((v) {
        data.add(new InsideDataLocal.fromJson(v));
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
    path = json['path'];
    perPage = json['per_page'];
    to = json['to'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this.currentPage;
    if (this.data!= null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['first_page_url'] = this.firstPageUrl;
    data['from'] = this.from;
    data['last_page'] = this.lastPage;
    data['last_page_url'] = this.lastPageUrl;
    if (this.links != null) {
      data['links'] = this.links.map((v) => v.toJson()).toList();
    }
    data['path'] = this.path;
    data['per_page'] = this.perPage;
    data['to'] = this.to;
    data['total'] = this.total;
    return data;
  }
}

class InsideDataLocal {
  int id;
  String name;
  String title;
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
  Category category;

  InsideDataLocal(
      {this.id,
        this.name,
        this.title,
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
        this.ratingSum,
        this.category});

  InsideDataLocal.fromJson(Map<String, dynamic> json) {
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
    category = json['category'] != null
        ? new Category.fromJson(json['category'])
        : null;
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
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    return data;
  }
}

class Category {
  int id;
  String name;
  String slug;
  int homePageCategory;
  String image;
  String createdAt;
  String updatedAt;

  Category(
      {this.id,
        this.name,
        this.slug,
        this.homePageCategory,
        this.image,
        this.createdAt,
        this.updatedAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    homePageCategory = json['home_page_category'];
    image = json['image'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['home_page_category'] = this.homePageCategory;
    data['image'] = this.image;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
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
