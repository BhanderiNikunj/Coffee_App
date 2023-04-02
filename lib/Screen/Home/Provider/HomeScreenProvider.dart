import 'package:flutter/material.dart';
import 'package:login_page/Utils/shared_preferences.dart';

class HomeScreenProvider extends ChangeNotifier {
  String? Name;
  List CoffeeImage = [
    "Assets/Images/Coffee/black_coffee.jpg",
    "Assets/Images/Coffee/latte_coffee.jpg",
    "Assets/Images/Coffee/cappuccino_coffee.jpg",
    "Assets/Images/Coffee/Americano_coffee.jpg",
    "Assets/Images/Coffee/Espresso_coffee.jpg",
    "Assets/Images/Coffee/doppio_coffee.jpg",
    "Assets/Images/Coffee/Cortado_coffee.jpg",
    "Assets/Images/Coffee/Galao_Coffee.jpg",
    "Assets/Images/Coffee/Lungo_Coffee.jpg",
    "Assets/Images/Coffee/Macchiato_Coffee.jpg",
    "Assets/Images/Coffee/Mocha_Coffee.jpg",
    "Assets/Images/Coffee/Ristretto_Coffee.jpg",
    "Assets/Images/Coffee/Flat White_Coffee.jpg",
    "Assets/Images/Coffee/Affogato_Coffee.jpg",
    "Assets/Images/Coffee/Cafe Aulait_Coffee.jpg",
    "Assets/Images/Coffee/Irish_Coffee.jpg",
  ];
  List CoffeeName = [
    "Black Coffee",
    "Latte Coffee",
    "Cappuccino Coffee",
    "Americano Coffee",
    "Espresso Coffee",
    "Doppio Coffee",
    "Cortado Coffee",
    "Galao Coffee",
    "Lungo Coffee",
    "Macchiato Coffee",
    "Mocha Coffee",
    "Ristretto Coffee",
    "Flat White Coffee",
    "Affogato Coffee",
    "Cafe Aulait Coffee",
    "Irish Coffee",
  ];
  List CoffeePrice = [
    "100 ₹",
    "120 ₹",
    "250 ₹",
    "150 ₹",
    "100 ₹",
    "80 ₹",
    "160 ₹",
    "140 ₹",
    "100 ₹",
    "150 ₹",
    "200 ₹",
    "199 ₹",
    "199 ₹",
    "220 ₹",
    "170 ₹",
    "170 ₹",
  ];
  Future<void> CheckName() async {
    Shr shr = Shr();
    Map m1 = await shr.readData();
    Name = m1['g1'];
  }
}
