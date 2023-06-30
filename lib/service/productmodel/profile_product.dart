class ProfileProduct {
  bool status;
  User7 data;
  int code;

  ProfileProduct({this.status, this.data, this.code});

  ProfileProduct.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new User7.fromJson(json['data']) : null;
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
class User7 {
  int id;
  String name;
  String email;
  dynamic mobileNumber;
  dynamic image;
  String emailVerifiedAt;
  int roleId;
  String createdAt;
  String updatedAt;

  User7(
      {this.id,
        this.name,
        this.email,
        this.mobileNumber,
        this.image,
        this.emailVerifiedAt,
        this.roleId,
        this.createdAt,
        this.updatedAt ,bool isDarkMode});

  User7.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobileNumber = json['mobile_number'];
    image = json['image'];
    emailVerifiedAt = json['email_verified_at'];
    roleId = json['role_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['mobile_number'] = this.mobileNumber;
    data['image'] = this.image;
    data['email_verified_at'] = this.emailVerifiedAt;
    data['role_id'] = this.roleId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}