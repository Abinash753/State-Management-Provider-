import 'package:flutter/material.dart';
import 'package:provider2/const.dart';

class NotifyListenerScreen extends StatelessWidget {
  NotifyListenerScreen({super.key});
  //
  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notify Listener Screen"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            //textform field
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: ValueListenableBuilder(
                valueListenable: toggle,
                builder: (context, value, child) {
                  return TextFormField(
                    obscureText: toggle.value,
                    decoration: InputDecoration(
                      hintText: "Enter Password",
                      suffix: InkWell(
                        onTap: () {
                          toggle.value = !toggle.value;
                        },
                        child: Icon(toggle.value
                            ? Icons.visibility_off_outlined
                            : Icons.visibility),
                      ),
                    ),
                  );
                },
              ),
            ),
            Center(
                child: ValueListenableBuilder(
              valueListenable: _counter,
              builder: (context, value, child) {
                return Text(
                  _counter.value.toString(),
                  style: Consts.textStyle,
                );
              },
            )),
          ],
        ),
      ),
      //floating action button
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 229, 14, 82),
        onPressed: () {
          _counter.value++;
          print(_counter.value.toString());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
