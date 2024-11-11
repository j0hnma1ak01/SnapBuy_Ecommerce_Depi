import 'package:bloc/bloc.dart';

import 'package:logger/logger.dart';
import 'package:snap_buy_app/features/home/data/model/categort/category_model.dart';
import 'package:snap_buy_app/features/home/data/repos/get_categories_repo.dart';
import 'package:snap_buy_app/features/home/logic/category_cubit/category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial()) {
    getCategories();
  }

  final GetCategiesRepo getCategiesRepo = GetCategiesRepo();

  List<CategoryModel> categories = [];

  void getCategories() async {
    emit(CategoryLoading());

    try {
      final response = await getCategiesRepo.getCategories();
      categories = response;

      emit(CategoryLoaded());
    } catch (e) {
      Logger().e(e.toString());
      emit(CategoryError(e.toString()));
    }
  }
 
 int selectedIndex = 0;
  void selectCategory(int index) {
    selectedIndex = index;
    emit(CategoryIsSelected());
  }
}
