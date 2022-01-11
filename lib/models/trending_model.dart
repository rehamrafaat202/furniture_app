class TrendingModel {
  String? id;
  String? title;
  String? type;
  String? img;
  String? description;
  dynamic sku;
  String? categories;
  String? tags;
  String? dimensions;

  dynamic price;
  List<ItemModel>? items = [];
  // List<SimilarProduct> similar = [];
  TrendingModel(
      {this.img,
      this.id,
      this.price,
      this.title,
      // required this.similar,
      this.description,
      this.categories,
      this.dimensions,
      this.sku,
      this.tags,
      this.items,
      this.type});
  TrendingModel.fromJson(Map<dynamic, dynamic> json) {
    title = json["title"];
    type = json["type"];
    img = json["img"];
    description = json["description"];
    sku = json["sku"];
    categories = json["categories"];
    dimensions = json["dimensions"];
    tags = json["tags"];
    price = json["price"];
    // if (json['items'] != null) {
    //   json['items'].forEach((v) {
    //     items!.add(ItemModel.fromJson(v));
    //   });
    // }
  }
  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "type": type,
      "img": img,
      "description": description,
      "sku": sku,
      "categories": categories,
      "tags": tags,
      "price": price,
      "dimensions": dimensions,
      if (items != null)
        "items": items!.map((e) {
          return e.toJson;
        }).toList(),
    };
  }
}

class ItemModel {
  String? id;
  String? image;
  ItemModel({this.id, this.image});
  ItemModel.fromJson(Map<dynamic, dynamic> json) {
    image = json["image"];
  }
  Map<String, dynamic> toJson() {
    return {
      "image": image,
    };
  }
}
