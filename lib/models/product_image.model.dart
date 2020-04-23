class ProductImageModel {
  String id;
  String image;
  String createDate;
  Null userCreate;

  ProductImageModel({this.id, this.image, this.createDate, this.userCreate});

  ProductImageModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    createDate = json['createDate'];
    userCreate = json['userCreate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['createDate'] = this.createDate;
    data['userCreate'] = this.userCreate;
    return data;
  }
}
