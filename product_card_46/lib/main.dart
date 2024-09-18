import 'package:flutter/material.dart';
import 'package:product_card_46/product_card.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: firstColor,
          title: const Text("Product Card"),
        ),
        body: ChangeNotifierProvider<ProductState>(
          create: (context) => ProductState(),
          child: Container(
            margin: const EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.topCenter,
              child: Consumer<ProductState>(
                builder: (context, productState, _) => ProductCard(
                  imageURL:
                      "https://c0.wallpaperflare.com/preview/964/594/360/berries-citrus-citrus-fruits-close-up.jpg",
                  name: "Buah-Buahan Mix 1 Kg",
                  price: "Rp. 25.000",
                  quantity: productState.quantity,
                  notification:
                      (productState.quantity >= 5) ? "Diskon 10%" : null,
                  onAddCartTap: () {},
                  onIncTap: () {
                    productState.quantity++;
                  },
                  onDecTap: () {
                    if (productState.quantity > 0) {
                      productState.quantity--;
                    }
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductState with ChangeNotifier {
  int _quantity = 0;

  int get quantity => _quantity;
  set quantity(int qty) {
    _quantity = qty;

    notifyListeners();
  }
}
