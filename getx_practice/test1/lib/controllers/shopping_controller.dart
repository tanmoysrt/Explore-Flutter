import 'package:get/state_manager.dart';
import 'package:test1/models/product.dart';

class ShoppingController extends GetxController {
  var products = List<Product>.empty().obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void fetchProducts() async {
    await Future.delayed(Duration(seconds: 1));
    var serverResponse = [
      Product(
          id: 1,
          productName: "Product 1",
          productImage: "image 1",
          productDescription: "Product des 1",
          price: 45),
      Product(
          id: 2,
          productName: "Product 2",
          productImage: "image 2",
          productDescription: "Product des 2",
          price: 90),
      Product(
          id: 3,
          productName: "Product 3",
          productImage: "image 3",
          productDescription: "Product des 3",
          price: 135),
    ];
    products.assignAll(serverResponse);
  }
}
