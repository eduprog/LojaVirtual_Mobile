class BannerModel {
  String title;
  String image;
  String url;
  int pos;
  int x;
  int y;
  Null userCreate;
  int local;
  String id;
  String createDate;

  BannerModel(
      {this.title,
      this.image,
      this.url,
      this.pos,
      this.x,
      this.y,
      this.userCreate,
      this.local,
      this.id,
      this.createDate});

  BannerModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    image = json['image'];
    url = json['url'];
    pos = json['pos'];
    x = json['x'];
    y = json['y'];
    userCreate = json['userCreate'];
    local = json['local'];
    id = json['id'];
    createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['image'] = this.image;
    data['url'] = this.url;
    data['pos'] = this.pos;
    data['x'] = this.x;
    data['y'] = this.y;
    data['userCreate'] = this.userCreate;
    data['local'] = this.local;
    data['id'] = this.id;
    data['createDate'] = this.createDate;
    return data;
  }
}
