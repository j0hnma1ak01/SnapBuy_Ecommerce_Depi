import 'package:dio/dio.dart';
import 'package:snap_buy_app/core/service/remote/api/api_consumer.dart';
import 'package:snap_buy_app/core/service/remote/api/dio_consumer.dart';
import 'package:snap_buy_app/core/service/remote/api/end_points.dart';
import 'package:snap_buy_app/features/home/data/model/categort/category_model.dart';


class GetCategiesRepo {
  ApiConsumer apiConsumer = DioConsumer();

  Future getCategories() async {
    try {
      Response response = await apiConsumer.get(EndPoints.categories);

      final categories = (response.data as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();

      return categories;
    } catch (e) {
      rethrow;
    }
  }
}
