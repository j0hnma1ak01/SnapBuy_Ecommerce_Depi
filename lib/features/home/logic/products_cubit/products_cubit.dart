import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:snap_buy_app/core/service/remote/api/end_points.dart';
import 'package:snap_buy_app/features/home/data/model/product/product_model.dart';
import 'package:snap_buy_app/features/home/data/repos/get_products_repo.dart';
import 'package:snap_buy_app/features/home/logic/products_cubit/products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial()) {
    getProducts(EndPoints.beauty);
  }

  final GetProductsRepo getProductsRepo = GetProductsRepo();
  List<ProductModel> products = [];

  void getProducts(String categoryName) async {
    emit(ProductsLoading());
    try {
      final response = await getProductsRepo.getProducts(categoryName);
      products = response;
      emit(ProductsLoaded());
    } catch (e) {
      Logger().e(e.toString());
      emit(ProductsError(e.toString()));
    }
  }
}
