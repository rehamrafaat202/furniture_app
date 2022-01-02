class HomeModel {
  List<Discover>? discover = [];
  List<Trending>? trending = [];
  List<Collection>? collections = [];
  List<BestSelling>? best = [];

  HomeModel({this.discover, this.trending, this.best, this.collections});
}

class Discover {
  String title;
  String img;
  int numOfItems;
  Discover({required this.img, required this.numOfItems, required this.title});
}

class Trending {
  String title;
  String type;
  String img;
  String description;
  int sku;
  String categories;
  String tags;
  String dimensions;

  double price;
  List<String> items = [];
  List<SimilarProduct> similar = [];
  Trending(
      {required this.img,
      required this.price,
      required this.title,
      required this.similar,
      required this.description,
      required this.categories,
      required this.dimensions,
      required this.sku,
      required this.tags,
      required this.items,
      required this.type});
}

class BestSelling {
  String title;

  String img;
  double price;

  BestSelling({
    required this.img,
    required this.price,
    required this.title,
  });
}

class Collection {
  String img;
  String title;
  Collection({required this.img, required this.title});
}

class SimilarProduct {
  String title;
  String img;
  double price;
  SimilarProduct({required this.img, required this.price, required this.title});
}

List<HomeModel> home = [
  HomeModel(discover: [
    Discover(
        img:
            "https://freepngimg.com/thumb/chair/3-2-chair-transparent-thumb.png",
        numOfItems: 200,
        title: "chairs"),
    Discover(
        img:
            "https://freepngimg.com/thumb/table/2-wooden-table-png-image-thumb.png",
        numOfItems: 250,
        title: "Tables"),
    Discover(
        img: "https://freepngimg.com/thumb/chair/4-2-chair-png-thumb.png",
        numOfItems: 200,
        title: "Sofa"),
  ], trending: [
    Trending(
        img: "https://freepngimg.com/thumb/chair/4-2-chair-png-thumb.png",
        price: 29.0,
        title: "Olivia Shayn Milittary Tv Cabinet",
        type: "Chairs/slide chair",
        sku: 545,
        categories: "Furniture,Accessories",
        tags: "#Furniture,#Table ",
        dimensions: "145x,20x,30x cm (L X W X H)",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut .",
        similar: [
          SimilarProduct(
              img: "https://freepngimg.com/thumb/chair/4-2-chair-png-thumb.png",
              price: 1000.0,
              title: "Georg jenson"),
          SimilarProduct(
              img: "https://freepngimg.com/thumb/chair/4-2-chair-png-thumb.png",
              price: 1000.0,
              title: "Georg jenson"),
          SimilarProduct(
              img:
                  "https://freepngimg.com/thumb/chair/6-2-chair-png-pic-thumb.png",
              price: 1000.0,
              title: "Georg jenson"),
          SimilarProduct(
              img:
                  "https://freepngimg.com/thumb/dining_table/6-2-dining-table-png-picture-thumb.png",
              price: 1000.0,
              title: "Georg jenson"),
          SimilarProduct(
              img:
                  "https://freepngimg.com/thumb/chair/6-2-chair-png-pic-thumb.png",
              price: 1000.0,
              title: "Georg jenson"),
        ],
        items: [
          "https://freepngimg.com/thumb/chair/9-2-chair-png-clipart-thumb.png",
          "https://freepngimg.com/thumb/table/21-table-png-image-thumb.png",
          "https://freepngimg.com/thumb/table/12-table-png-image-thumb.png",
          "https://freepngimg.com/thumb/table/16-table-png-image-thumb.png"
        ]),
    Trending(
        img:
            "https://freepngimg.com/thumb/chair/3-2-chair-transparent-thumb.png",
        price: 29.0,
        sku: 545,
        categories: "Furniture,Accessories",
        tags: "#Furniture,#Table ",
        dimensions: "145x,20x,30x cm (L X W X H)",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        similar: [
          SimilarProduct(
              img:
                  "https://freepngimg.com/thumb/dining_table/2-2-dining-table-free-download-png-thumb.png",
              price: 1000.0,
              title: "Georg jenson"),
          SimilarProduct(
              img: "https://freepngimg.com/thumb/chair/4-2-chair-png-thumb.png",
              price: 1000.0,
              title: "Georg jenson"),
          SimilarProduct(
              img:
                  "https://freepngimg.com/thumb/chair/6-2-chair-png-pic-thumb.png",
              price: 1000.0,
              title: "Georg jenson"),
          SimilarProduct(
              img: "https://freepngimg.com/thumb/chair/4-2-chair-png-thumb.png",
              price: 1000.0,
              title: "Georg jenson"),
          SimilarProduct(
              img:
                  "https://freepngimg.com/thumb/chair/6-2-chair-png-pic-thumb.png",
              price: 1000.0,
              title: "Georg jenson"),
        ],
        title: "lovono chair green",
        items: [
          "https://freepngimg.com/thumb/chair/5-2-chair-png-hd-thumb.png",
          "https://freepngimg.com/thumb/chair/9-2-chair-png-clipart-thumb.png",
          "https://freepngimg.com/thumb/table/21-table-png-image-thumb.png",
          "https://freepngimg.com/thumb/table/12-table-png-image-thumb.png",
          "https://freepngimg.com/thumb/table/16-table-png-image-thumb.png"
        ],
        type: "Tables/Slide table"),
    Trending(
        img:
            "https://freepngimg.com/thumb/chair/3-2-chair-transparent-thumb.png",
        price: 29.0,
        title: "lovono chair green",
        sku: 545,
        categories: "Furniture,Accessories",
        tags: "#Furniture,#Table ",
        dimensions: "145x,20x,30x cm (L X W X H)",
        description:
            "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
        similar: [
          SimilarProduct(
              img: "https://freepngimg.com/thumb/chair/4-2-chair-png-thumb.png",
              price: 1000.0,
              title: "Georg jenson"),
          SimilarProduct(
              img:
                  "https://freepngimg.com/thumb/chair/6-2-chair-png-pic-thumb.png",
              price: 1000.0,
              title: "Georg jenson"),
          SimilarProduct(
              img: "https://freepngimg.com/thumb/chair/4-2-chair-png-thumb.png",
              price: 1000.0,
              title: "Georg jenson"),
          SimilarProduct(
              img:
                  "https://freepngimg.com/thumb/chair/6-2-chair-png-pic-thumb.png",
              price: 1000.0,
              title: "Georg jenson")
        ],
        items: [
          "https://freepngimg.com/thumb/chair/9-2-chair-png-clipart-thumb.png",
          "https://freepngimg.com/thumb/table/21-table-png-image-thumb.png",
          "https://freepngimg.com/thumb/table/12-table-png-image-thumb.png",
          "https://freepngimg.com/thumb/table/16-table-png-image-thumb.png"
        ],
        type: "tables")
  ], collections: [
    Collection(
        img:
            "https://freepngimg.com/thumb/chair/9-2-chair-png-clipart-thumb.png",
        title: "New Arrivals\n winter"),
    Collection(
        img:
            "https://freepngimg.com/thumb/chair/9-2-chair-png-clipart-thumb.png",
        title: "New Arrivals\n winter"),
    Collection(
        img:
            "https://freepngimg.com/thumb/chair/9-2-chair-png-clipart-thumb.png",
        title: "New Arrivals\n winter"),
  ], best: [
    BestSelling(
        img:
            "https://freepngimg.com/thumb/chair/9-2-chair-png-clipart-thumb.png",
        price: 30.9,
        title: "Drop Shoulder Geo Pattern"),
    BestSelling(
        img:
            "https://freepngimg.com/thumb/chair/9-2-chair-png-clipart-thumb.png",
        price: 30.9,
        title: "Drop Shoulder Geo Pattern"),
    BestSelling(
        img:
            "https://freepngimg.com/thumb/chair/9-2-chair-png-clipart-thumb.png",
        price: 30.9,
        title: "Drop Shoulder Geo Pattern")
  ]),
];
