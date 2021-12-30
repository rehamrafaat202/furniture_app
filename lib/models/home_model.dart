class HomeModel {
  List<Discover>? discover = [];
  List<Trending>? trending = [];

  HomeModel({this.discover, this.trending});
}

class Discover {
  String title;
  String img;
  int numOfItems;
  Discover({required this.img, required this.numOfItems, required this.title});
}

class Trending {
  String title;
  String img;
  double price;
  Trending({required this.img, required this.price, required this.title});
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
        img:
            "https://freepngimg.com/thumb/chair/3-2-chair-transparent-thumb.png",
        price: 29.0,
        title: "lovono chair green"),
    Trending(
        img:
            "https://freepngimg.com/thumb/chair/3-2-chair-transparent-thumb.png",
        price: 29.0,
        title: "lovono chair green"),
    Trending(
        img:
            "https://freepngimg.com/thumb/chair/3-2-chair-transparent-thumb.png",
        price: 29.0,
        title: "lovono chair green")
  ]),
];
