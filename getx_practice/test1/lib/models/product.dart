
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class Product {
  final int id;
  final String productName;
  final String productImage;
  final String productDescription;
  final double price;
  final RxBool isFavourite = false.obs;

  Product(
      {required this.id,
      required this.productName,
      required this.productImage,
      required this.productDescription,
      required this.price});
}
