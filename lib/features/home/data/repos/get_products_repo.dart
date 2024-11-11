
import 'package:snap_buy_app/core/service/remote/api/api_consumer.dart';
import 'package:snap_buy_app/core/service/remote/api/dio_consumer.dart';
import 'package:snap_buy_app/features/home/data/model/product/product_model.dart';

class GetProductsRepo {
  final ApiConsumer apiConsumer = DioConsumer();

  Future<List<ProductModel>> getProducts(String categoryName) async {
    try {
      final response = await apiConsumer.get(categoryName);
      final products = (response.data['products'] as List)
          .map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList();
      return products;
    } catch (e) {
      rethrow;
    }
  }
}