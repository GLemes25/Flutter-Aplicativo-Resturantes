import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/model/restaurant.dart';

class RestaurantsData extends ChangeNotifier {
  List<Restaurant> listRestaurants = [];
  Future<void> getRestaurant() async {
    String jsonString = await rootBundle.loadString('assets/data.json');
    Map<String, dynamic> data = json.decode(jsonString);
    List<dynamic> restaurantsData = data['restaurants'];

    for (var restaurant in restaurantsData) {
      listRestaurants.add(Restaurant.fromMap(restaurant));
    }
  }
}
