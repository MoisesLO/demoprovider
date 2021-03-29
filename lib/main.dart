import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:demoprovider/datos_provider.dart';
import 'datos_model.dart';
import 'datos_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => StateProvider(),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
          appBar: AppBar(
            title: Text('AppaBar'),
          ),
          body: HomePage()),
    );
  }
}

class HomePage extends StatefulWidget {
  final Todo item;

  const HomePage({Key key, this.item}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _nombreEditingController = TextEditingController();
  TextEditingController _apellidoEditingController = TextEditingController();
  @override
  void initState() {
    if (widget.item != null) {
      _nombreEditingController.text = widget.item.nombre;
      _apellidoEditingController.text = widget.item.apellido;
      super.initState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          TextField(
            controller: _nombreEditingController,
          ),
          TextField(
            controller: _apellidoEditingController,
          ),
          RaisedButton(
            child: Text('Submit'),
            onPressed: submit,
          )
        ],
      ),
    );
  }

  void submit() {
    final String nombre = _nombreEditingController.text;
    final String apellido = _apellidoEditingController.text;
    // context.read<StateProvider>().addNewData('nombre', 'apellido');
    context.read<StateProvider>().addNewData(nombre, apellido);
    print(context.read<StateProvider>().items[0].apellido);
  }
}
