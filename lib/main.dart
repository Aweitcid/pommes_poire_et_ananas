import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<int> _itemList = [];
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      _itemList.add(_counter);
    });
  }

  bool _isPrime(int number) {
    if (number <= 1) {
      return false;
    }
    for (int i = 2; i * i <= number; i++) {
      if (number % i == 0) {
        return false;
      }
    }
    return true;
  }

  String _getItemImage(int itemValue) {
    if (_isPrime(itemValue)) {
      return 'images/ananas.png';
    } else if (itemValue.isEven) {
      return 'images/poire.png';
    } else {
      return 'images/pomme.png';
    }
  }

  String _getCounterType(int counterValue) {
    if (_isPrime(counterValue)) {
      return 'nombre premier';
    } else if (counterValue.isEven) {
      return 'pair';
    } else {
      return 'impair';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        title: Text(
          '$_counter (${_getCounterType(_counter)})',
        ),
      ),
      body: ListView.builder(
        itemCount: _itemList.length,
        itemBuilder: (BuildContext context, int index) {
          final item = _itemList[index];
          final itemImage = _getItemImage(item);
          final itemBackgroundColor =
              itemImage == 'images/ananas.png' ? Colors.green : Colors.orange;
          return Container(
            color: itemBackgroundColor,
            child: ListTile(
              leading: Image.asset(
                itemImage,
                width: 40,
                height: 40,
              ),
              title: Text(
                'Item $item',
                style: const TextStyle(color: Colors.white),
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
