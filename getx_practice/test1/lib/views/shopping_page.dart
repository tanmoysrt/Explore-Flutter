import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/controllers/cart_controller.dart';
import 'package:test1/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({Key? key}) : super(key: key);
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(child: GetX<ShoppingController>(builder: (controller) {
              return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.products[index].productName,
                                      style: const TextStyle(fontSize: 24),
                                    ),
                                    Text(controller
                                        .products[index].productDescription),
                                  ],
                                ),
                                Text('\$${controller.products[index].price}',
                                    style: const TextStyle(fontSize: 24)),
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                cartController
                                    .addTocart(controller.products[index]);
                              },
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.blue,
                                  textStyle:
                                      const TextStyle(color: Colors.white)),
                              child: const Text('Add to Cart'),
                            ),
                            Obx(() => IconButton(
                                  icon: controller
                                          .products[index].isFavourite.value
                                      ? const Icon(Icons.check_box_rounded)
                                      : const Icon(Icons
                                          .check_box_outline_blank_outlined),
                                  onPressed: () {
                                    controller.products[index].isFavourite
                                        .toggle();
                                  },
                                )),
                          ],
                        ),
                      ),
                    );
                  });
            })),
            GetX<CartController>(builder: (controller) {
              return Text(
                "Total amount : " + controller.totalPrice.toString(),
                style: const TextStyle(fontSize: 32, color: Colors.white),
              );
            }),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        backgroundColor: Colors.amber,
        icon: const Icon(
          Icons.add_shopping_cart,
          color: Colors.black,
        ),
        label: GetX<CartController>(builder: (controller) {
          return Text(
            controller.count.toString(),
            style: const TextStyle(color: Colors.black),
          );
        }),
      ),
    );
  }
}
