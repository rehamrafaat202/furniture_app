import 'package:flutter/material.dart';
import 'package:furniture_shop_app/screens/product_details/test2.dart';
import 'package:furniture_shop_app/services/counter_sevice.dart';
import 'package:provider/provider.dart';

class TestProvider extends StatelessWidget {
  const TestProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<CounterService>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text(counter.count.toString())),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => TestProvider2()));
        },
      ),
    );
  }
}
