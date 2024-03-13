class WishListModel {
  String? id;

  WishListModel({this.id});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {'productId': id};
    return {
      'data': data,
    };
  }

  factory WishListModel.fromJson(Map<String, dynamic> json) {
    return WishListModel(
      id: json['data'],
    );
  }
}
