import 'package:flutter/material.dart';
import 'package:demoprovider/datos_model.dart';

class StateProvider with ChangeNotifier {
  List<Todo> items = List<Todo>.empty(growable: true);

  void addNewData(String nombre, String apellido) {
    items.add(Todo(nombre, apellido));
  }
}
