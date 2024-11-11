abstract class CategoryState {}

final class CategoryInitial extends CategoryState {}

final class CategoryLoading extends CategoryState {}

final class CategoryLoaded extends CategoryState {}

final class CategoryError extends CategoryState {
  final String message;

  CategoryError(this.message);
}

final class CategoryIsSelected extends CategoryState {}
