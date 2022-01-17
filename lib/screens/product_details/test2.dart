import 'package:flutter/material.dart';
import 'package:furniture_shop_app/services/counter_sevice.dart';
import 'package:provider/provider.dart';

class TestProvider2 extends StatelessWidget {
  const TestProvider2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var counter = Provider.of<CounterService>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Text("counter.count.toString()")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          counter.addCount();
        },
      ),
    );
  }
}
