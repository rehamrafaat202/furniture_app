import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/discover_model.dart';
import 'package:furniture_shop_app/repositry/furniture_repository.dart';
import 'package:furniture_shop_app/style.dart';
import 'package:furniture_shop_app/widgets/container_button.dart';
import 'package:furniture_shop_app/widgets/default_text_form.dart';

class AddCollectionScreen extends StatefulWidget {
  const AddCollectionScreen({Key? key}) : super(key: key);

  @override
  _AddCollectionScreenState createState() => _AddCollectionScreenState();
}

class _AddCollectionScreenState extends State<AddCollectionScreen> {
  var furnitureNameController = TextEditingController();
  var furnitureTypeController = TextEditingController();
  var furniturePriceController = TextEditingController();
  var furnitureItemsController = TextEditingController();
  void clear() {
    furnitureItemsController.clear();
    furnitureNameController.clear();
    furniturePriceController.clear();
    furnitureTypeController.clear();
    repository.profileImage = null;
  }

  bool isloading = false;
  void addLoading() {
    setState(() {
      isloading = false;
    });
  }

  var formKey = GlobalKey<FormState>();
  FurnitureRepository repository = FurnitureRepository();

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
                      Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white,
                          border: Border.all(color: scendryColor, width: 4),
                          image: repository.profileImage != null
                              ? DecorationImage(
                                  image: FileImage(
                                    repository.profileImage!,
                                  ),
                                  fit: BoxFit.cover)
                              : const DecorationImage(
                                  image: NetworkImage(
                                      "https://www.pngitem.com/pimgs/m/294-2947257_interface-icons-user-avatar-profile-user-avatar-png.png")),
                        ),
                      ),
                      TextButton(
                          onPressed: () async {
                            await repository.getImage(getState: () {
                              setState(() {});
                            }).then((value) {});
                          },
                          child: const Text(
                            "Furniture Image",
                            style: TextStyle(color: Colors.black),
                          ))
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
                  control: furnitureTypeController,
                  type: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Furniture can't be Empty";
                    }
                    return null;
                  },
                  label: "Furniture Type",
                ),
                const SizedBox(
                  height: 25,
                ),
                defaultFormText(
                  control: furnitureItemsController,
                  type: TextInputType.number,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Furniture Items can't be Empty";
                    }
                    return null;
                  },
                  label: "Furniture Items",
                ),
                const SizedBox(
                  height: 25,
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
                                .addFurnitureDiscover(
                                    model: DiscoverModel(
                                        numOfItems:
                                            furnitureItemsController.text,
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
                                          'Your Discover Furniture added successfuly ')));
                              // setState(() async {
                              // await repository
                              //     .displayDiscover()
                              //     .then((value) {
                              //   print(value.length);

                              //   clear();
                              // });

                              // repository.model.add(value);
                              // });
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
