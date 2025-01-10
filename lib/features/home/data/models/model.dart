class Model {
  List<Data> list = [];

  Model.fromJson(List<dynamic> json) {
    json.forEach((element) {
      list.add(Data.fromJson(element));
    });
  }
}

class Data {
  String? id;
  String? image;
  String? title;
  String? priority;
  String? status;
  String? desc;
  String? createdAt;
  String? user;

  Data.fromJson(Map<String, dynamic> json) {
    user = json['user'];
    createdAt = json['createdAt'];
    id = json['_id'];
    desc = json['desc'];
    image = json['image'];
    title = json['title'];
    priority = json['priority'];
    status = json['status'];
  }
}
