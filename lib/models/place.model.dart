class PlaceModel {
  String id;
  String createDate;
  String title;
  String telephone;
  double latitude;
  double longitude;
  String image;
  String address;
  bool visibleOnApp;

  PlaceModel(
      {this.id,
      this.createDate,
      this.title,
      this.telephone,
      this.latitude,
      this.longitude,
      this.image,
      this.address,
      this.visibleOnApp});

  PlaceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createDate = json['createDate'];
    title = json['title'];
    telephone = json['telephone'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    image = json['image'];
    address = json['address'];
    visibleOnApp = json['visibleOnApp'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['createDate'] = this.createDate;
    data['title'] = this.title;
    data['telephone'] = this.telephone;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['image'] = this.image;
    data['address'] = this.address;
    data['visibleOnApp'] = this.visibleOnApp;
    return data;
  }
}
