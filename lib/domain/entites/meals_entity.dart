class MealsResponseEntity {
  final List<MealsEntity>? meals;

  MealsResponseEntity ({
    this.meals,
  });


}

class MealsEntity {
  final String? strMeal;
  final String? strMealThumb;
  final String? idMeal;

  MealsEntity ({
    this.strMeal,
    this.strMealThumb,
    this.idMeal,
  });


}


