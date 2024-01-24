import 'package:flutter/material.dart';
import 'package:imc_calculation_flutter/controller/home_controller.dart';
import 'package:rx_notifier/rx_notifier.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = HomeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('IMC Calculator'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: controller.setPeso,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Peso',
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: controller.setAltura,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Altura',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  controller.calculateIMC();
                },
                child: const Text('Calcular'),
              ),
              const SizedBox(height: 20),
              RxBuilder(
                builder: (_) => Text(controller.result),
              ),
            ],
          ),
        ));
  }
}
