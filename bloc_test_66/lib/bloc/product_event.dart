part of 'product_bloc.dart';

sealed class ProductEvent extends Equatable {
  final Product product;
  const ProductEvent(this.product);

  @override
  List<Object> get props => [product];
}

class AddProduct extends ProductEvent {
  const AddProduct(super.product);
  @override
  List<Object> get props => [product];
}

class RemoveProduct extends ProductEvent {
  const RemoveProduct(super.product);
  @override
  List<Object> get props => [product];
}
