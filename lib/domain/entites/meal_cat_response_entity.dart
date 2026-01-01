class MealCatResponseEntity {
  final List<CategoriesEntity>? categories;

  MealCatResponseEntity({this.categories});
}

class CategoriesEntity {
  final String? idCategory;
  final String? strCategory;
  final String? strCategoryThumb;
  final String? strCategoryDescription;

  CategoriesEntity({
    this.idCategory,
    this.strCategory,
    this.strCategoryThumb,
    this.strCategoryDescription,
  });
}
