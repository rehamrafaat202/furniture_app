import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/also_like_model.dart';

import 'package:furniture_shop_app/repositry/trending_repository.dart';
import 'package:furniture_shop_app/style.dart';
import 'package:furniture_shop_app/widgets/add_image.dart';
import 'package:furniture_shop_app/widgets/container_button.dart';
import 'package:furniture_shop_app/widgets/default_text_form.dart';

class AlsoLikeScreen extends StatefulWidget {
  final String? productId;
  const AlsoLikeScreen({required this.productId, Key? key}) : super(key: key);

  @override
  _AlsoLikeScreenState createState() => _AlsoLikeScreenState();
}

class _AlsoLikeScreenState extends State<AlsoLikeScreen> {
  var furnitureNameController = TextEditingController();

  var furniturePriceController = TextEditingController();

  void clear() {
    setState(() {});

    furnitureNameController.clear();
    furniturePriceController.clear();

    repository.profileImage = null;
  }

  bool isloading = false;
  void addLoading() {
    setState(() {
      isloading = false;
    });
  }

  var formKey = GlobalKey<FormState>();
  TrendingRepository repository = TrendingRepository();

  @override
  Widget build(BuildContext context) {
    print(widget.productId);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.close)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("add similar items".toUpperCase(),
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 25)),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AddImage(
                          profileImage: repository.profileImage,
                          getImage: () {
                            repository.getImage(getState: () {
                              setState(() {});
                            }).then((value) {});
                          }),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35,
                ),
                defaultFormText(
                  control: furnitureNameController,
                  type: TextInputType.name,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Furniture Name can't be Empty";
                    }
                    return null;
                  },
                  label: "Furniture Name",
                ),
                const SizedBox(
                  height: 25,
                ),
                defaultFormText(
                  control: furniturePriceController,
                  type: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Furniture Price can't be Empty";
                    }
                    return null;
                  },
                  label: "Furniture Price",
                ),
                const SizedBox(
                  height: 60,
                ),
                isloading
                    ? const Center(
                        child: CircularProgressIndicator(
                          color: primaryColor,
                        ),
                      )
                    : ContainerButton(
                        color: const Color(0xff242A37),
                        txtColor: Colors.white,
                        title: "ADD",
                        submit: () {
                          if (formKey.currentState!.validate()) {
                            setState(() {
                              isloading = true;
                            });

                            repository
                                .addAlsoLike(
                                    model: AlsoLikeModel(
                                        price: furniturePriceController.text,
                                        productId: widget.productId,
                                        title: furnitureNameController.text),
                                    addLoading: () => addLoading(),
                                    context: context)
                                .then((value) {
                              // clear();
                              setState(() {
                                isloading = false;
                              });

                              showDialog(
                                      context: context,
                                      builder: (ctx) => const AlertDialog(
                                          content: Text(
                                              ' Furniture added successfuly ')))
                                  .then((value) {
                                clear();
                              });
                            }).catchError((e) {
                              return e;
                            });
                          }
                        }),
                const SizedBox(
                  height: 12,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
