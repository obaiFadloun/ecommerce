class DeleteCart {
  bool status;
  String message;
  List<String> errors;
  int code;

  DeleteCart({this.status, this.message, this.errors, this.code});

  DeleteCart.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    errors = json['errors'].cast<String>();
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['errors'] = this.errors;
    data['code'] = this.code;
    return data;
  }
}
