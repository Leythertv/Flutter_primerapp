import 'package:flutter/material.dart';

class PizzaDetailsScreen extends StatelessWidget {
  final String pizzaName;

  const PizzaDetailsScreen({super.key, required this.pizzaName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de la Pizza: $pizzaName'),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Carrito de Compras')),
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
            child: FutureBuilder<ImageProvider?>(
              future: _getImage(pizzaName),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator(); // Mientras carga la imagen
                } else if (snapshot.hasError) {
                  return const Center(child: Text('Imagen no encontrada')); // Si hay error
                } else if (snapshot.hasData) {
                  return CircleAvatar(
                    radius: 100,
                    backgroundImage: snapshot.data,
                  );
                } else {
                  return const CircleAvatar( //Imagen no encontrada
                    radius: 100,
                    backgroundColor: Colors.deepOrange,
                  );
                }
              },
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Text('Aquí irían los detalles de la pizza: $pizzaName',
                style: const TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }

  Future<ImageProvider?> _getImage(String pizzaName) async {
    try {
      // Asegúrate de que pizzaName sea una cadena válida
      final imageAsset = AssetImage('assets/images/$pizzaName.png');
      return imageAsset; // Retorna el AssetImage directamente
    } catch (e) {
      print(e); // Imprime cualquier error para debugging
      return null;
    }
  }
}
