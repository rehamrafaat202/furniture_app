import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/best_selling_model.dart';
import 'package:furniture_shop_app/repositry/selling_repository.dart';
import 'package:furniture_shop_app/style.dart';
import 'package:furniture_shop_app/widgets/add_image.dart';
import 'package:furniture_shop_app/widgets/container_button.dart';
import 'package:furniture_shop_app/widgets/default_text_form.dart';

class BestSellingCollection extends StatefulWidget {
  const BestSellingCollection({Key? key}) : super(key: key);

  @override
  _BestSellingCollectionState createState() => _BestSellingCollectionState();
}

class _BestSellingCollectionState extends State<BestSellingCollection> {
  var furnitureNameController = TextEditingController();
  var furniturePriceController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  SellingRepository repo = SellingRepository();
  void clear() {
    setState(() {});
    furnitureNameController.clear();
    furniturePriceController.clear();

    repo.profileImage = null;
  }

  bool isloading = false;
  void addLoading() {
    setState(() {
      isloading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                const Text("Furniture Details",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
                const SizedBox(
                  height: 30,
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AddImage(
                          profileImage: repo.profileImage,
                          getImage: () {
                            repo.getImage(getState: () {
                              setState(() {});
                            }).then((value) {});
                          }),
                    ],
                  ),
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

                            repo
                                .addBestSellingFurniture(
                                    model: BestSellingModel(
                                        price: furniturePriceController.text,
                                        title: furnitureNameController.text),
                                    addLoading: () => addLoading(),
                                    context: context)
                                .then((value) {
                              setState(() {
                                isloading = false;
                              });

                              showDialog(
                                      context: context,
                                      builder: (ctx) => const AlertDialog(
                                          title: Text(' GOOD JOB'),
                                          content: Text(
                                              'Your Discover Furniture added successfuly ')))
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
