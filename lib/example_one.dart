import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider2/provider/example1_provider.dart';

class ExampleOneScreen extends StatefulWidget {
  const ExampleOneScreen({super.key});

  @override
  State<ExampleOneScreen> createState() => _ExampleOneScreenState();
}

class _ExampleOneScreenState extends State<ExampleOneScreen> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<ExampleOneProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Example"),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Consumer<ExampleOneProvider>(
            builder: (context, value, child) => Slider(
                min: 0,
                max: 1,
                value: provider.value,
                onChanged: (val) {
                  provider.setValue(val);
                }),
          ),
          Consumer<ExampleOneProvider>(
            builder: (context, value, child) {
              return Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 45, 44, 31)
                              .withOpacity(provider.value)),
                      child: const Text("First Container",
                          style: TextStyle(
                              color: Color.fromARGB(255, 233, 228, 228),
                              fontSize: 20)),
                    ),
                  ),
                  //second container
                  Expanded(
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 232, 206, 8)
                              .withOpacity(provider.value)),
                      child: const Text(
                        "Second Container",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
