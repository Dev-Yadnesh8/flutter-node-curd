// ignore_for_file: unnecessary_this

class UserModel {
  String? sId;
  String? name;
  String? email;
  String? url;
  int? iV;

  UserModel({this.sId, this.name, this.email, this.iV});

  UserModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    email = json['email'];
    url = json['profileUrl'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['_id'] = this.sId;
    data['name'] = this.name;
    data['email'] = this.email;
    data['profileUrl'] = this.url;
    data['__v'] = this.iV;
    return data;
  }
}