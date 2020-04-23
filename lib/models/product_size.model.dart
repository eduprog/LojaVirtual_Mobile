class ProductSizeModel {
  String id;
  String size;
  String createDate;
  Null userCreate;

  ProductSizeModel({this.id, this.size, this.createDate, this.userCreate});

  ProductSizeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    size = json['size'];
    createDate = json['createDate'];
    userCreate = json['userCreate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['size'] = this.size;
    data['createDate'] = this.createDate;
    data['userCreate'] = this.userCreate;
    return data;
  }
}
