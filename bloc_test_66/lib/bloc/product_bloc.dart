import 'package:bloc/bloc.dart';
import 'package:bloc_test_66/models/product.dart';
import 'package:equatable/equatable.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitial()) {
    on<AddProduct>((event, emit) {
      if (state is ProductInitial) {
        emit(ProductLoaded([event.product]));
      } else {
        final currentState = state as ProductLoaded;
        if (!currentState.products.contains(event.product)) {
          emit(ProductLoaded([...currentState.products, event.product]));
        }
      }
    });

    on<RemoveProduct>((event, emit) {
      if (state is ProductInitial) {
        emit(state);
      } else {
        final currenctState = state as ProductLoaded;
        emit(ProductLoaded(currenctState.products
            .where((item) => item != event.product)
            .toList()));
      }
    });
  }
}
