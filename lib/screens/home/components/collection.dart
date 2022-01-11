import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/new_collection_model.dart';
import 'package:furniture_shop_app/repositry/new_collection_repository.dart';
import 'package:furniture_shop_app/style.dart';
import 'package:furniture_shop_app/models/home_model.dart';

class Collection extends StatefulWidget {
  const Collection({Key? key}) : super(key: key);

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {
  NewCollectionRepository repository = NewCollectionRepository();
  List<NewCollectionModel> collection = [];
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: repository.displayNewCollection(),
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
              collection = snapshot.data as List<NewCollectionModel>;
              return Container(
                height: 250,
                width: double.infinity,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: collection.length,
                  itemBuilder: (context, index) => Container(
                      margin: const EdgeInsets.all(10),
                      width: 320,
                      decoration: BoxDecoration(
                        color: banner,
                        border: Border.all(color: Colors.black12),
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 3,
                            blurRadius: 8,
                            offset: const Offset(
                                0, 4), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Stack(children: [
                        Positioned(
                          top: 20.0,
                          right: 15.0,
                          child: Image.network(
                            collection[index].img!,
                            width: 150,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                "Collection",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(collection[index].title!,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 29,
                                  )),
                              const Spacer(),
                              Container(
                                width: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Row(
                                      children: [
                                        Text("Shop now".toUpperCase(),
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                            )),
                                        const Icon(Icons.arrow_right)
                                      ],
                                    ),
                                    const Divider(
                                      color: Colors.black,
                                      thickness: 1,
                                      height: 1,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ])),
                ),
              );
            }
          }
        });
  }
}
