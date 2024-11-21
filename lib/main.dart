import 'package:flutter/material.dart';
import 'Pizza.dart'; // Importa Pizza.dart

// Define la lista de pizzas como una constante fuera de la clase PizzaList
const List<String> pizzaTypes = [
    'Pepperoni',
    'Hawaiana',
    'Vegetariana',
    'Mexicana',
    'Cuatro Quesos',
    'Margherita',
  ];

void main() {
  runApp(const PizzaApp());
}

class PizzaApp extends StatelessWidget {
  const PizzaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza App',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const PizzaList(),
          );
  }
}

class PizzaList extends StatelessWidget {
  const PizzaList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Elige tu Pizza'),
      ),
      body: ListView.builder(
        itemCount: pizzaTypes.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: ElevatedButton(
            onPressed: () {
                // Navega a la pantalla de detalles de la pizza
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PizzaDetailsScreen(
                      pizzaName: pizzaTypes[index],
                    ),
            ),
          );
        },
              child: Text(pizzaTypes[index]),
      ),
    );
        },
      ),
    );
  }
}