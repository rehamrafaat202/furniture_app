import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/discover_model.dart';
import 'package:furniture_shop_app/repositry/discover_repository.dart';
import 'package:furniture_shop_app/style.dart';

class DiscoverList extends StatefulWidget {
  const DiscoverList({
    Key? key,
  }) : super(key: key);

  @override
  State<DiscoverList> createState() => _DiscoverListState();
}

class _DiscoverListState extends State<DiscoverList> {
  FurnitureRepository repository = FurnitureRepository();

  List<DiscoverModel> model = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: repository.displayDiscover(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(
                color: primaryColor,
              ),
            );
          } else {
            if (snapshot.hasError) {
              return Text('${snapshot.data}');
            } else {
              model = snapshot.data as List<DiscoverModel>;
              return Container(
                height: 250,
                margin: const EdgeInsets.only(right: 10),
                child: model.isEmpty
                    ? Container(
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          height: 200,
                          width: 170,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(25),
                              color: primaryColor),
                          child: Center(
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              color: Colors.black38,
                              child: const Text(
                                "No items added yet",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ),
                          ),
                        ),
                      )
                    : ListView.builder(
                        scrollDirection: Axis.horizontal,
                        physics: const BouncingScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: model.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Container(
                                  margin: const EdgeInsets.only(right: 10),
                                  height: 250,
                                  width: 170,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(25),
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          model[index].img!,
                                        ),
                                        // fit: BoxFit.cover,
                                      ),
                                      color: primaryColor),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 8.0, top: 10),
                                child: Text(
                                  model[index].title!,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 23),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text("${model[index].numOfItems!} items",
                                    style: const TextStyle(
                                        color: containerGround,
                                        fontWeight: FontWeight.bold)),
                              ),
                            ],
                          );
                        }),
              );
            }
          }
        });
  }
}
