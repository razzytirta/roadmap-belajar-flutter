import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listview_builder_bloc_49/product_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => ProductBloc(),
        child: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  MainPage({super.key});
  final Random r = Random();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Listview Builder BLoC",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: firstColor,
      ),
      body: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: firstColor,
            ),
            onPressed: () {
              BlocProvider.of<ProductBloc>(context).add(r.nextInt(4) + 2);

              print(r.nextInt(4) + 2);
            },
            child: const Text(
              "Create a Products",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          BlocBuilder<ProductBloc, List<Product>>(
            builder: (context, products) => Expanded(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product = products[index];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      (index == 0)
                          ? const SizedBox(
                              width: 20,
                            )
                          : Container(),
                      ProductCard(
                        imageURL: product.imageURL,
                        name: product.name,
                        price: product.price.toString(),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                    ],
                  );
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}

class Product {
  String? imageURL;
  String? name;
  int? price;

  Product({this.imageURL, this.name, this.price});
}

class ProductBloc extends Bloc<int, List<Product>> {
  ProductBloc() : super([]) {
    on<int>((event, emit) {
      List<Product> products = [];
      for (var i = 0; i < event; i++) {
        products.add(
          Product(
            imageURL:
                "https://c0.wallpaperflare.com/preview/964/594/360/berries-citrus-citrus-fruits-close-up.jpg",
            name: "Product ${i.toString()}",
            price: (i + 1) * 5000,
          ),
        );
      }
      emit(products);
    });
  }
}
