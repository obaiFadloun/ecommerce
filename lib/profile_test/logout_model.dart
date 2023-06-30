class LogOutModel {
  bool status;
  String data;
  int code;

  LogOutModel({this.status, this.data, this.code});

  LogOutModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['data'] = this.data;
    data['code'] = this.code;
    return data;
  }
}
