class WishListModel {
  String? id;

  WishListModel({this.id});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {'productId': id};
    // final Map<String, String> headers = {'Authorization': "bearer $token"};
    return {'data': data, };
  }

  factory WishListModel.fromJson(Map<String, dynamic> json) {
    return WishListModel(
      id: json['data'],
    );
  }
}