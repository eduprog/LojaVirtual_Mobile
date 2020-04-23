class CategoryModel {
  String id;
  String title;
  String icon;
  String createDate;
  String userCreate;

  CategoryModel(
      {this.id, this.title, this.icon, this.createDate, this.userCreate});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    icon = json['icon'];
    createDate = json['createDate'];
    userCreate = json['userCreate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['icon'] = this.icon;
    data['createDate'] = this.createDate;
    data['userCreate'] = this.userCreate;
    return data;
  }
}
