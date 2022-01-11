import 'package:flutter/material.dart';
import 'package:furniture_shop_app/models/discover_model.dart';
import 'package:furniture_shop_app/models/new_collection_model.dart';
import 'package:furniture_shop_app/repositry/discover_repository.dart';
import 'package:furniture_shop_app/repositry/new_collection_repository.dart';
import 'package:furniture_shop_app/style.dart';
import 'package:furniture_shop_app/widgets/add_image.dart';
import 'package:furniture_shop_app/widgets/container_button.dart';
import 'package:furniture_shop_app/widgets/default_text_form.dart';

class AddCollectionScreen extends StatefulWidget {
  const AddCollectionScreen({Key? key}) : super(key: key);

  @override
  _AddCollectionScreenState createState() => _AddCollectionScreenState();
}

class _AddCollectionScreenState extends State<AddCollectionScreen> {
  var furnitureTitleController = TextEditingController();

  void clear() {
    setState(() {});
    furnitureTitleController.clear();
    repo.profileImage = null;
  }

  bool isloading = false;
  void addLoading() {
    setState(() {
      isloading = false;
    });
  }

  var formKey = GlobalKey<FormState>();
  NewCollectionRepository repo = NewCollectionRepository();

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
                const Text("Collection Details",
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
                          getImage: () => repo.getImage(getState: () {
                                setState(() {});
                              }).then((value) {})),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 35.0,
                ),
                defaultFormText(
                  control: furnitureTitleController,
                  type: TextInputType.text,
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Furniture Title can't be Empty";
                    }
                    return null;
                  },
                  label: "Furniture Title",
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
                                .addNewCollectionFurniture(
                                    model: NewCollectionModel(
                                        title: furnitureTitleController.text),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
