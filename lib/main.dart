// Importa el paquete de Flutter para trabajar con widgets visuales y agregarlos a la aplicación
import 'package:flutter/material.dart';

void main() {
  // Llama al método run app para correr la aplicación
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  // Este widget es el root o raíz de la aplicación.
  @override
  Widget build(BuildContext context) {
    // Retorna una instancia de Material App, que representa la configuración de la aplicación.
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // Este es el tema de la aplicación. Cambiará los colores de la interfaz de usuario.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
          title:
              'Flutter Demo Home Page'), //Este es el widget principal de la aplicación.
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter =
      0; // Esta variable guarda la cantidad de veces que el botón de incrementar ha sido presionado.
  int _level = 0; // Esta variable guarda el nivel actual.

  void _incrementCounter() {
    setState(() {
      _counter++; // Incrementa el contador cada vez que se presiona el botón.
      if (_counter % 10 == 0) {
        // Si el contador es divisible por 10 (después de sumar uno), el nivel sube.
        _showLevelUpDialog(); // Muestra una ventana emergente con un mensaje de felicitaciones
        _level = _counter ~/ 10; // Actualiza la variable de nivel
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        // Si el contador es mayor a cero, permite restar uno.
        _counter--;
      }
    });
  }

  Future<void> _showLevelUpDialog() async {
    await showDialog(
      // Muestra una ventana emergente con información de nivel alcanzado.
      context: context,
      builder: (_) => AlertDialog(
        title: const Text('Nivel Completado'),
        content: Text('Has completado el nivel $_level.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // Define el esqueleto de la página principal, utilizando el Scaffold de Flutter.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:', // Título de la aplicación.
            ),
            Text(
              '$_counter (level $_level)', // Muestra el contador y el nivel en texto, utilizando valores guardados en las variables.
              style: Theme.of(context).textTheme.headline6, // Estilo del texto.
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _decrementCounter,
            tooltip:
                'Decrement', // Información mostrada cuando se mantiene presionado el botón.
            child: const Icon(Icons.remove), // Icono del botón.
          ),
          const SizedBox(width: 16), // Espacio entre ambos botones.
          FloatingActionButton(
            onPressed: _incrementCounter,
            tooltip:
                'Increment', // Información mostrada cuando se mantiene presionado el botón.
            child: const Icon(Icons.add), // Icono del botón.
          ),
        ],
      ),
    );
  }
}
