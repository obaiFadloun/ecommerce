// class get profile with para
class GetProfile {
  bool status;
  Data data;
  int code;

  GetProfile({this.status, this.data, this.code});

  GetProfile.fromJson(Map<String, dynamic> json) {
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
// details data profile
class Data {
  int id;
  String name;
  String email;
  Null mobileNumber;
  Null image;
  Null emailVerifiedAt;
  int roleId;
  String createdAt;
  String updatedAt;

  Data(
      {this.id,
        this.name,
        this.email,
        this.mobileNumber,
        this.image,
        this.emailVerifiedAt,
        this.roleId,
        this.createdAt,
        this.updatedAt});

 // json data
  Data.fromJson(Map<String, dynamic> json) {
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
  // map getprofile
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
