import 'package:bloc_test/bloc_test.dart';
import 'package:bloc_test_66/bloc/product_bloc.dart';
import 'package:bloc_test_66/models/product.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Product Bloc Test', () {
    late ProductBloc productBloc;

    setUp(() {
      productBloc = ProductBloc();
    });

    tearDown(() {
      productBloc.close();
    });

    test("Initial state is ProductInitial", () {
      expect(productBloc.state, equals(ProductInitial()));
    });

    blocTest<ProductBloc, ProductState>(
      "Add Product",
      build: () => productBloc,
      act: (bloc) async {
        bloc.add(const AddProduct(Product(name: "Apel", price: 2000)));
      },
      expect: () => [
        const ProductLoaded([Product(name: "Apel", price: 2000)])
      ],
    );
    blocTest<ProductBloc, ProductState>(
      "Add 2 Product",
      build: () => productBloc,
      act: (bloc) async {
        bloc.add(const AddProduct(Product(name: "Apel", price: 2000)));
        bloc.add(const AddProduct(Product(name: "Durian", price: 10000)));
      },
      expect: () => [
        const ProductLoaded([Product(name: "Apel", price: 2000)]),
        const ProductLoaded(
          [
            Product(name: "Apel", price: 2000),
            Product(name: "Durian", price: 10000)
          ],
        )
      ],
    );
    blocTest<ProductBloc, ProductState>(
      "Remove Product",
      build: () => productBloc,
      act: (bloc) async {
        bloc.add(const RemoveProduct(Product(name: "Apel", price: 2000)));
      },
      expect: () => [ProductInitial()],
    );
    blocTest<ProductBloc, ProductState>(
      "Remove Product (Product Loaded)",
      build: () => productBloc,
      act: (bloc) async {
        bloc.add(const AddProduct(Product(name: "Apel", price: 2000)));
        bloc.add(const RemoveProduct(Product(name: "Apel", price: 2000)));
      },
      expect: () => [
        const ProductLoaded([Product(name: "Apel", price: 2000)]),
        const ProductLoaded([])
      ],
    );
  });
}
