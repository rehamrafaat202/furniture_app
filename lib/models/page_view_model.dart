class PagesViewModel {
  final String image;
  final String title;
  final String body;
  PagesViewModel(
      {required this.image, required this.title, required this.body});
}

List<PagesViewModel> items = [
  PagesViewModel(
      image: "assets/images/fun1.jpg",
      title: "Discover",
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,  "),
  PagesViewModel(
      image: "assets/images/fun6.jpg",
      title: "New Arrivals",
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"),
  PagesViewModel(
      image: "assets/images/fun3.jpg",
      title: "Our Favourite\n Looks For Your Style",
      body: "Lorem ipsum dolor sit amet, consectetur adipiscing elit,"),
];
