import 'package:flutter/material.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/state_manager.dart';
import 'package:test1/models/product.dart';
import 'package:get/get.dart';
import 'package:test1/views/settings_page.dart';

class CartController extends GetxController {
  var cartItems = List<Product>.empty().obs;
  int get count => cartItems.length;
  double get totalPrice =>
      cartItems.fold(0, (sum, item) => ((sum) + item.price));

  void addTocart(Product product) {
    cartItems.add(product);
    // Get.snackbar("Hi", "mess", icon: Icon(Icons.ac_unit));
    // Get.off(SettingsPage());
    // Get.defaultDialog(
    //     onConfirm: () => print("Ok"),
    //     middleText: "Dialog made in 3 lines of code");
    Get.bottomSheet(Container(
      color: Colors.amber,
      child: Wrap(
        children: <Widget>[
          ListTile(
              leading: Icon(Icons.music_note),
              title: Text('Music'),
              onTap: () {}),
          ListTile(
            leading: Icon(Icons.videocam),
            title: Text('Video'),
            onTap: () {},
          ),
        ],
      ),
    ));
  }
}
