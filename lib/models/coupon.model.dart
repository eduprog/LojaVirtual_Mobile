class CouponModel {
  String reference;
  double percent;

  CouponModel({this.reference, this.percent});

  CouponModel.fromJson(Map<String, dynamic> json) {
    reference = json['reference'];
    percent = json['percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['reference'] = this.reference;
    data['percent'] = this.percent;
    return data;
  }
}
