class ProductModel {
  String? id;
  String? title;
  String? description;
  String? category;
  int? price;
  String? image;

  ProductModel(
      {this.title,
      this.id,
      this.description,
      this.category,
      this.image,
      this.price});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['_id'];
    title = json['title'];
    description = json['description'];
    category = json['category'];
    price = json['price'];
    image = json['image'];
  }
 
}
